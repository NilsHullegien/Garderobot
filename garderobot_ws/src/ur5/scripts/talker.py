#!/usr/bin/env python

#rospy = ros python
import rospy
from std_msgs.msg import Int32

def talker():
	# Init de publisher:
	# Gaat berichten verzenden op "topic" 'chatter' (soort kanaal)
	# Gaat berichten versturen via type Int32
	# De queue_size is het aantal berichten dat wordt opgeslagen in een queue.
	pub = rospy.Publisher('chatter', Int32, queue_size=10)
	
	# Init de node genaamd 'talker'
	# Voor dit punt kan er nog niet met de master node gecommuniceerd worden.
	# Als 2 nodes met dezelfde naam gelaunched worden, wordt de eerste Node gekicked/verwijderd.
	# Anonymous zorgt ervoor dat er altijd een unieke ID gekozen zal worden, zodat er meerdere nodes met de naam talker gemaakt kunnen worden.
	rospy.init_node('talker', anonymous=True)
	rate = rospy.Rate(10) #Verstuur berichten op een rate van 10 Hz
	
	# Zo lang als het programma draait, doe wat in de loop staat
	while not rospy.is_shutdown():
		msg = 3
		# Log de info van msg naar het scherm, de log file en naar rosout (voor rqt_control e.d.)
		rospy.loginfo(msg)
		# Publish het bericht msg naar topic 'chatter'
		pub.publish(msg)
		# Slaap zo lang dat de 10 Hz van de rate gehandhaafd blijft.
		rate.sleep()
		
		
# Blijkbaar standaard python spul ;)
if __name__ == '__main__':
	try:
		talker()
		# Exception die gegooid kan worden als terminal met Ctrl-c afgesloten wordt en rate.sleep() wordt gecalled. 
	except rospy.ROSInterruptException:
		pass
