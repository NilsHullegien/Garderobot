import Tkinter as tk
import socket
import time
import zbar 

Remote_IP = "169.254.108.222"
Host_IP = "169.254.223.148"
Port = 5005
Reachmsg = "reach out coat hanger"
Retractmsg = "retract coat hanger"
Grabempmsg = "grab empty coat hanger"
Grabcmd = "grab coat hanger nr:"
Hangmsg = "hang up the coat hanger"
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((Host_IP,Port))

title_font = ("Helvetica", 18, "bold")

class Gardegui(tk.Tk):

    def __init__(self, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)


        root = tk.Frame(self)
        root.pack(fill = "both", side = "top", expand = True)
        root.grid_rowconfigure(0, weight = 1)
        root.grid_columnconfigure(0, weight = 1)

        self.frames = {}
        for F in (Start, Leave, Retrieve, Wait):
            page_name = F.__name__
            frame = F(parent = root, controller = self)
            self.frames[page_name] = frame

            frame.grid(row = 0, column = 0, sticky = "nsew")

        self.show_frame("Start")

    def show_frame(self, page_name):
        frame = self.frames[page_name]
        frame.tkraise()
        
    def Grabempcmd(self):
        sock.sendto(Grabempmsg,(Remote_IP,Port))
        time.sleep(0.3)
        sock.sendto(Reachmsg,(Remote_IP,Port))
        self.show_frame("Wait")
        
    def waiting(self, Window):
        while True:
            data, addr = sock.recvfrom(1024)
            if data == "done":
                print "received"
                break
        self.show_frame(Window)
        
    def Hangcmd(self):
        sock.sendto(Retractmsg,(Remote_IP,Port))
        time.sleep(1)
        sock.sendto(Hangmsg,(Remote_IP,Port))

    def combineFunc(*funcs):
        def combinedFunc(*args, **kwargs):
            for f in funcs:
                f(*args, **kwargs)
        return combinedFunc
    
class Start(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        self.controller = controller
        label = tk.Label(self, text = "Welcome to the GardeRobot", font = title_font)
        label.pack(side = "top", fill = "x", pady = 10)

        Button = tk.Button(self, text = "Jas achterlaten / Leave your coat", command = lambda: controller.combineFunc(controller.Grabempcmd(),controller.waiting("Leave")))
        Button2 = tk.Button(self, text = "Jas ophalen / Retrieve your coat", command = lambda: controller.show_frame("Retrieve"))

        Button.pack(fill = "both", side = "left", expand = True)
        Button2.pack(fill = "both", side = "right", expand = True)


class Leave(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        self.controller = controller
        label = tk.Label(self, text = "Please hang your coat", font = title_font)
        label.pack(side = "top", fill = "x", pady = 10)

        Button = tk.Button(self, text = "Back", command = lambda: controller.show_frame("Start"))
        Button2 = tk.Button(self, text = "Please click here when coat is hung", command = lambda: controller.combineFunc(controller.Hangcmd(),controller.show_frame("Start")))

        Button.pack(fill = "x", side = "bottom", pady = 10)
        Button2.pack(fill = "both", side = "top", expand = True)


class Retrieve(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        self.controller = controller
        label = tk.Label(self, text = "Please grab your coat", font = title_font)
        label.pack(side = "top", fill = "x", pady = 10)

        Button = tk.Button(self, text = "Back", command = lambda: controller.show_frame("Start"))
        Button2 = tk.Button(self, text = "Please click here when coat is grabbed", command = lambda: controller.combineFunc(controller.Hangcmd(),controller.show_frame("Start")))

        Button.pack(fill = "x", side = "bottom", pady = 10)
        Button2.pack(fill = "both", side = "top", expand = True)
        

class Wait(tk.Frame):
    
    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        self.controller = controller
        label = tk.Label(self, text = "Please wait", font = title_font)
        label.pack(side = "top", fill = "both", expand = True)
    
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
