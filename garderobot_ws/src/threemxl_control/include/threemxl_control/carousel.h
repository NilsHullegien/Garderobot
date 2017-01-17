#ifndef CAROUSEL_H
#define CAROUSEL_H

#include <ros/ros.h>
#include <threemxl/C3mxl.h>
#include <threemxl/C3mxlROS.h>
#include <std_msgs/Int8.h>

#include "threemxl_control/movement_publisher.h"

class Carousel {
  private:
    C3mxl *motor;
    
  public: 
    Carousel();
    ~Carousel() {
      delete motor;
    }
    
    void move(double speed);
    double getPosition();
    void moveCallback(const std_msgs::Int8 &msg);
};
#endif
  
