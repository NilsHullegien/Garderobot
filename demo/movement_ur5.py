import urx
import time
import math

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
    jas_optillen_2, jas_optillen, in_hanger, naast_jas2
]
joints_carousel_to_user = map_list_of_tuples(joints_carousel_to_user_deg)
joints_user_to_carousel = map_list_of_tuples(joints_user_to_carousel_deg)

def to_user():
  print "Moving to User"
  for coord in joints_carousel_to_user:
    rob.movej(*coord)
  
def to_carousel():
  print "Moving to Carousel"
  for coord in joints_user_to_carousel:
    rob.movej(*coord)

def grab_coat():
  print "Grabbing coat"
  to_carousel()

def hang_coat():
  print "Hanging coat"
  to_carousel()

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

def main():
	while True:
		to_user()
		time.sleep(8)
		to_carousel()
		rob.movej(*map_tuple(rust))
		time.sleep(3)
    
if __name__ == "__main__":
  main()
