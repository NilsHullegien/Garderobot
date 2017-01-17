#include <ros/ros.h>
#include <threemxl/C3mxlROS.h>

#include "threemxl_control/carousel.h"
#include "threemxl_control/movement_publisher.h"

int main(int argc, char** argv)
{
  ros::init(argc, argv, "carousel");
  ros::NodeHandle n;
  double updateRate = 50;
  
  Carousel *carousel = new Carousel();
  MovementPublisher *pub = new MovementPublisher(carousel, n);
  ros::Subscriber sub = n.subscribe("carousel", 100, &Carousel::moveCallback, carousel);
  
  ros::Rate r(updateRate);
  while(n.ok()) {
    ros::spinOnce();
    pub->publishMovement();
    r.sleep();
  }
  return 0;
}
