#ifndef MOVEMENT_PUBLISHER_H
#define MOVEMENT_PUBLISHER_H

#include <ros/ros.h>
#include <threemxl/C3mxl.h>
#include <threemxl/C3mxlROS.h>
#include <std_msgs/Int8.h>

#include "threemxl_control/carousel.h"

class MovementPublisher {
  private:
    Carousel *carousel;
    ros::Publisher mov_pub;
  
  
  public:
    MovementPublisher(Carousel*, ros::NodeHandle);
    
    void publishMovement();
};
#endif
  
