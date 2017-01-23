#include <threemxl/C3mxl.h>

#include "threemxl_control/carousel.h"

int main(int argc, char** argv)
{
  Carousel *carousel = new Carousel();
  carousel->setSpeed(1.f);

  return 0;
}
