#include "threemxl_control/carousel.h"

#define SAFE_CALL(call) \
    do { \
      int ret = call; \
      if (ret !=DXL_SUCCESS) { \
        std::cout << "Error:" << std::endl << " " << C3mxl::translateErrorCode(ret) << " (0x" << std::hex << ret << std::dec << ")" << std::endl; \
      } \
    } while (0)

int ratio = 183;
//Full rotation (2 pi) = 500 * 183 = 91500
//Per position: 91500/11 = 8318.18 ticks

/**
 * Constructor for the Carousel
 */
Carousel::Carousel() 
{
  std::string usbAddress = "/dev/ttyUSB0";
  
  //usb_address = "i:0x0403:0x6001" / "/dev/ttyUSB0"
  LxSerial *serial_port = new LxSerial();
  CDxlConfig *config = new CDxlConfig();

  serial_port->port_open(usbAddress, LxSerial::RS485_FTDI);
  serial_port->set_speed(LxSerial::S921600);
  
  motor = new C3mxl();
  
  motor->setSerialPort(serial_port);

  motor->setConfig(config->setID(107));
  
  ROS_INFO("Starting");
  while(motor->init(false) != DXL_SUCCESS) 
  {
    printf("Failed to init, trying again...");
    sleep(100);
  } 
  ROS_INFO("Started!");
  //Setting the engine mode to mode mode
  SAFE_CALL(motor->set3MxlMode(PWM_MODE));
  SAFE_CALL(motor->setAcceleration(3));
}

void Carousel::move(double speed)
{
  SAFE_CALL(motor->setSpeed(speed));
}

double Carousel::getPosition()
{
  return motor->getPos();
}

void Carousel::moveCallback(const std_msgs::Int8 &msg)
{
  ROS_INFO(msg.data);
}


