#ifndef CAROUSEL_H
#define CAROUSEL_H

#include <threemxl/C3mxl.h>
#include <threemxl/LxFTDI.h>

class Carousel {
  private:
    C3mxl *motor;
    
  public: 
    Carousel();
    ~Carousel() {
      delete motor;
    }
    
    void setSpeed(double speed);
    void setPosition(double pos, double v, double a);
    double getPosition();
};

#endif
