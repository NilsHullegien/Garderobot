import cv2
import zbar 
import time
import threading
import Tkinter as tk
import garderobot

from PIL import Image, ImageTk


title_font = ("Helvetica", 18, "bold")
algo = garderobot.Garderobot(11, 2)

class Gardegui(tk.Tk):

    def __init__(self, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)


        root = tk.Frame(self)
        root.pack(fill = "both", side = "top", expand = True)
        root.grid_rowconfigure(0, weight = 1)
        root.grid_columnconfigure(0, weight = 1)

        self.windows = {}
        for F in (Start, Leave, Retrieve, ScanWindow):
            page_name = F.__name__
            window = F(parent = root, controller = self)
            self.windows[page_name] = window

            window.grid(row = 0, column = 0, sticky = "nsew")
        algo.hang(9)
        
        self.show_window("Start")

    def show_window(self, page_name):
        window = self.windows[page_name]
        window.tkraise()

    def combineFunc(*funcs):
        def combinedFunc(*args, **kwargs):
            for f in funcs:
                f(*args, **kwargs)
        return combinedFunc

    def scan(self):
        window = self.windows["ScanWindow"]
        window.start()

    def stop(self, Next):
        window = self.windows["ScanWindow"]
        window.stop()
        self.show_window(Next)
    
class Start(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        self.controller = controller
        label = tk.Label(self, text = "Welcome to the GardeRobot", font = title_font)
        label.pack(side = "top", fill = "x", pady = 10)

        Button = tk.Button(self, text = "Jas achterlaten / Leave your coat", command = lambda: controller.show_window("Leave"))
        Button2 = tk.Button(self, text = "Jas ophalen / Retrieve your coat", command = lambda: controller.combineFunc(controller.show_window("ScanWindow"),controller.scan()))

        Button.pack(fill = "both", side = "left", expand = True)
        Button2.pack(fill = "both", side = "right", expand = True)


class Leave(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        self.controller = controller
        label = tk.Label(self, text = "Please hang your coat", font = title_font)
        label.pack(side = "top", fill = "x", pady = 10)

        Button = tk.Button(self, text = "Back", command = lambda: controller.show_window("Start"))
        Button2 = tk.Button(self, text = "Please click here when coat is hung", command = lambda: controller.show_window("Start"))

        Button.pack(fill = "x", side = "bottom", pady = 10)
        Button2.pack(fill = "both", side = "top", expand = True)


class Retrieve(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        self.controller = controller
        label = tk.Label(self, text = "Please grab your coat", font = title_font)
        label.pack(side = "top", fill = "x", pady = 10)

        Button = tk.Button(self, text = "Back", command = lambda: controller.show_window("Start"))
        Button2 = tk.Button(self, text = "Please click here when coat is grabbed", command = lambda: controller.show_window("Start"))

        Button.pack(fill = "x", side = "bottom", pady = 10)
        Button2.pack(fill = "both", side = "top", expand = True)


class Scanner(object):
    def __init__(self, handler, *args, **kwargs):
        self.thread = threading.Thread(target = self.run)
        self.handler = handler

        self.CV_SYSTEM_CACHE_CNT = 5
        self.LOOP_INTERVAL_TIME = 0.2
        self.cam = cv2.VideoCapture(-1)

        self.scanner = zbar.ImageScanner()
        self.scanner.parse_config('enable')
        self.cam_width = int(self.cam.get(cv2.CAP_PROP_FRAME_WIDTH))
        self.cam_height = int(self.cam.get(cv2.CAP_PROP_FRAME_HEIGHT))

        self.last_symbol = None

    def start(self):
        self.thread.start()

    def scan(self, aframe):
        imgray = cv2.cvtColor(aframe,cv2.COLOR_BGR2GRAY)
        raw = str(imgray.data)
        image_zbar = zbar.Image(self.cam_width, self.cam_height, 'Y800', raw)
        self.scanner.scan(image_zbar)

        for symbol in image_zbar:
            return symbol.data

    def run(self):
        print 'starting scanner'

        while True:
            if self.handler.need_stop():
                break

            for i in range(0, self.CV_SYSTEM_CACHE_CNT):
                self.cam.read()

            img = self.cam.read()
            self.handler.send_frame(img)
            self.data = self.scan(img[1])

            if self.handler.need_stop():
                break

            if self.data is not None and (self.last_symbol is None or self.last_symbol <> self.data):
                self.handler.send_symbol(self.data)
                self.last_symbol = self.data

            time.sleep(self.LOOP_INTERVAL_TIME)

        self.cam.release()
        
class ScanWindow(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, master = parent)
        self.controller = controller
        self.parent = parent
        label = tk.Label(self, text = "scan your ticket please", font = title_font)
        label.pack(side = "top", fill = "x", pady = 10)

        self.img_label = tk.Label(self)
        self.img_label.pack(side = "top")

        close_button = tk.Button(self, text = "back", command = lambda: controller.stop("Start"))
        close_button.pack(fill = "x", side = "bottom", pady = 10)

        self.scanner = None

        self.lock = threading.Lock()
        self.stop_event = threading.Event()

        parent.bind('<<ScannerFrame>>', self.on_frame)
        parent.bind('<<ScannerEnd>>', self.quit)
        parent.bind('<<ScannerSymbol>>', self.on_symbol)


    def start(self):
        self.frames = []
        self.symbols = []

        class Handler(object):
            def need_stop(self_):
                return self.stop_event.is_set()

            def send_frame(self_, frame):
                self.lock.acquire(True)
                self.frames.append(frame)
                self.lock.release()

                self.parent.event_generate('<<ScannerFrame>>', when = 'tail')

            def send_symbol(self_, data):
                self.lock.acquire(True)
                self.symbols.append(data)
                self.lock.release()

                self.parent.event_generate('<<ScannerSymbol>>', when='tail')

        self.stop_event.clear()
        self.scanner = Scanner(Handler())
        self.scanner.start()

    def stop(self):
        if self.scanner is None:
            return

        self.stop_event.set()

        self.frames = []
        self.symbols = []
        self.scanner = None

    def quit(self, *args):
        self.controller.stop("Retrieve")

    def on_symbol(self, *args):
        self.lock.acquire(True)
        symbol_data = self.symbols.pop(0)
        self.lock.release()

        print 'received symbol', '"%s"' % symbol_data
        temp = int(symbol_data)
        algo.take(temp)
        self.after(500, self.quit)

    def on_frame(self, *args):
        self.lock.acquire(True)
        frame = self.frames.pop(0)
        self.lock.release()

        _, img = frame
        img = cv2.flip(img, 1)
        cv2image = cv2.cvtColor(img, cv2.COLOR_BGR2RGBA)
        img = Image.fromarray(cv2image)
        imgtk = ImageTk.PhotoImage(image = img)
        self.img_label.imgtk = imgtk
        self.img_label.configure(image=imgtk)
            
if __name__ == "__main__":
    gui = Gardegui()
    full = True
    gui.attributes("-fullscreen", full)

    def toggle_fullscreen(parent):
        global full
        if full:
            full = False
        else:
            full = True
        gui.attributes("-fullscreen", full)
        
    gui.bind("<Escape>", toggle_fullscreen)
    
    gui.mainloop()
