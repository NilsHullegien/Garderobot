#!/usr/bin/env python

import carousel

if __name__ == "__main__":
	c = carousel.Carousel("/dev/ttyUSB0")
	c.set_speed_mode()
	c.set_speed_acc_torque(1, 1, 1)
	print (c.test())
