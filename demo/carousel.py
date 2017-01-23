#!/usr/bin/env python

import carousel
import time

def wait_for_position(pos, c, threshold=0.01):
	while c.get_position() < pos - threshold or c.get_position() > pos + threshold:
		print(pos, c.get_position())
	return c.get_position()

if __name__ == "__main__":
	c = carousel.Carousel("/dev/ttyUSB0")

	offset = 10
	while offset > 0.2:
		raw_input("Press ENTER to start init")
		c.external_init(0.1, 0.1, 0)
		time.sleep(0.3)
	
		while c.get_speed() != 0:
			print(c.get_speed(), c.get_position())
		offset = c.get_position()
	
	print("The offset is {} radians".format(offset))

	raw_input("Press ENTER to start")

	c.set_pwm_mode()
	c.set_pwm(0.999)

	pos = wait_for_position(8, c)
	c.set_pwm(0)
	print("Should be 8: {}".format(pos))

	print(c.test())
