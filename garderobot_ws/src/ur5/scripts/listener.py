#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def callback(data):
	rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
	
def listener():
	# Maak een listener node aan
	# Als 2 nodes met dezelfde naam gelaunched worden, wordt de eerste Node gekicked/verwijderd.
	# Anonymous zorgt ervoor dat er altijd een unieke ID gekozen zal worden, zodat er meerdere nodes met de naam listener gemaakt kunnen worden.
	rospy.init_node('listener', anonymous=True)
	
	# Subscribe op het topic 'chatter' dat gemaakt is in de talker.py file. 
	# De methode callback wordt aangeroepen op het moment dat de subscriber een String message ontvangt. 
	rospy.Subscriber('chatter', String, callback)
	
	# Spin zorgt ervoor dat python niet afsluit totdat de listener node gestopt is. 
	rospy.spin()
	
if __name__ == '__main__':
	listener()
	
