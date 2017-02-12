#!/usr/bin/env python

import urx
import time
import math
import socket
import carousel

# ip = "127.0.0.1"
ip = "192.168.1.22"
rob = urx.Robot(ip)
naast_jas = ((-136.822, -109.235, 97.590, 9.913, 101.157, -143.961), 0.3, 0.3)
naast_jas2 = ((-134.325, -110.052, 98.103, 10.200, 103.653, -144.039), 0.3, 0.3)
in_hanger = ((-138.640, -109.265, 91.697, 15.845, 99.339, -143.906), 0.3, 0.3)
jas_optillen = ((-132.436, -110.788, 92.220, 16.804, 105.542, -144.099), 0.3, 0.3)
jas_optillen_2 = ((-130.139, -114.313, 94.193, 18.334, 107.837, -144.173), 0.3, 0.3)
onk_1 = ((-138.163, -114.716, 94.402, 18.589, 99.816, -143.920), 1, 1)
onk_2 = ((-174.830, -114.716, 94.402, 18.589, 94.113, -143.920), 1, 1)
onk_3 = ((-249.348, -111.046, 92.424, 13.505, 19.669, -116.460), 1, 1)
onk_4 = ((-241.451, -94.111, 79.677, 10.773, 27.544, -103.971), 1, 1)
afleveren = ((-237.332, -59.102, 19.816, 36.156, 33.669, -53.531), 1, 1)
rust = ((-112.138, -117.715, 102.311, 13.308, 147.792, -144.854), 0.5, 0.5)

Host_IP = "192.168.1.28"
Remote_IP = "192.168.1.54"
Port = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((Host_IP, Port))

def deg_to_rad(deg):
  return deg / 180 * math.pi

def map_coord(coord):
  return map(deg_to_rad, coord)

def map_tuple(t):
  return (map_coord(t[0]), t[1], t[2])

def map_list_of_tuples(l):
  return map(map_tuple, l)

joints_carousel_to_user_deg = [
    naast_jas2, in_hanger, jas_optillen, jas_optillen_2,
    onk_2, onk_3, onk_4, 
    afleveren
  ]

joints_user_to_carousel_deg = [
  onk_4, onk_3, onk_2,
    jas_optillen_2, jas_optillen, in_hanger, naast_jas2,
    rust
]
joints_carousel_to_user = map_list_of_tuples(joints_carousel_to_user_deg)
joints_user_to_carousel = map_list_of_tuples(joints_user_to_carousel_deg)

def to_user():
  print "Moving to User"
  for coord in joints_carousel_to_user:
    rob.movej(*coord)
  sock.sendto("done", (Remote_IP, Port))
  
def to_carousel():
  print "Moving to Carousel"
  for coord in joints_user_to_carousel:
    rob.movej(*coord)
  sock.sendto("done", (Remote_IP, Port))
  return_to_default_pos_wheel()

########
#TO DO:#
#Coord voor carousel
#coord voor init [ergens in het midden]
#Coord voor bij user
#Pad tussen carousel -> user
#Pad tussen user -> carousel
#Carousel -> Jacket -> Carousel [OPHANGEN] 
#Carousel -> Jacket -> Carousel [AFHALEN]
########
#rob.movel(coord_safe, acceleration, velocity)
#print "Current tool pose is (DEFAULT): ",  rob.getl()
#time.sleep(1)
#rob.movel(coord_carousel, acceleration, velocity)
#print "Current tool pose is (CAROUSEL): ",  rob.getl()
#time.sleep(1)
#rob.movel(coord_user, acceleration, velocity)
#print "Current tool pose is (USER): ",  rob.getl()
#rob.stopl(acceleration)
#print "Movements successfull"

#rob.stopl()

#rob.movel(coord_test_rel, acceleration, velocity, relative=True)

#Return to position 5
def return_to_default_pos_wheel(current_pos):
  if(pos < 5):
    c.setPWM(-0.3)
    wait_for_position(wheel_pos, c)
  elif(pos > 5):
    c.setPWM(0.3)
    wait_for_position(wheel_pos, c)
  return

def wait_for_msg():
  while True:
    data, addr = sock.recvfrom(1024)

def wait_for_position(pos, c, threshold=0.01):
  while c.get_position() < pos - threshold or c.get_position() > pos + threshold:
    print(pos, c.get_position())
  return c.get_position()

##TODO: Positie afstanden invullen!!!
def convertToRadian(pos):
  positions = {0: -5.758, 1: -3.447, 2: -1.252, 3: 0.924, 4: 3.19, 5: 5.469, 6: 7.634, 7: 9.906, 8: 12.182, 9: 14.332, 10:16.602}
  return positions[pos]

# 1 = -5.758
# 2 = -3.447
# 3 = -1.252
# 4 = 0.924
# 5 = 3.19
# 6 = 5.469
# 7 = 7.634
# 8 = 9.906
# 9 = 12.182
# 10 = 14.332
# 11 = 16.602
def turn_wheel(pos, c):
  wheel_pos = convertToRadian(pos)
  if(pos < 5):
    c.setPWM(0.3)
    wait_for_position(wheel_pos, c)
  elif(pos > 5):
    c.setPWM(-0.3)
    wait_for_position(wheel_pos, c)
  sock.sendto("turned", (Remote_IP, Port))
  return

def main():
  c = carousel.Carousel("/dev/ttyUSB0")

  #External init with offset
  offset = 10
  while offset > 0.2:
    c.external_init()
    time.sleep(0.6)
  
    while c.get_speed() != 0:
      pass
      # print(c.get_speed(), c.get_position())
    offset = c.get_position()
    print("Offset: {}".format(offset))

  #Set mode
  c.set_pwm_mode()

  return_to_default_pos_wheel(c.get_position())
  
  while True:
    data, addr = sock.recvfrom(1024)
    if data == "user":
        to_user()
    if data == "carousel":
        to_carousel()
    if data == "turn_wheel":
        turn_wheel(data[10:], c)
    
if __name__ == "__main__":
  main()
