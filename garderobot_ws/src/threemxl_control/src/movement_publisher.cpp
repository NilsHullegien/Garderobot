#include "threemxl_control/movement_publisher.h"

MovementPublisher::MovementPublisher(Carousel *carousel_priv, ros::NodeHandle n) {
  carousel = carousel_priv;
  mov_pub = n.advertise<std_msgs::Int8>("carousel", 50);
}

void MovementPublisher::publishMovement() {
  std_msgs::Int8 msg;
  msg.data = 42;//TODO calculation
  mov_pub.publish(msg);
}
