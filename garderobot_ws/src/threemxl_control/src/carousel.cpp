#include "threemxl_control/carousel.h"

#define SAFE_CALL(call) \
    do { \
      int ret = call; \
      if (ret != DXL_SUCCESS) { \
        std::cout << "Error:" << std::endl << " " << C3mxl::translateErrorCode(ret) << " (0x" << std::hex << ret << std::dec << ")" << std::endl; \
      } \
    } while (0)

float ratio = 183;
WORD encoder_count = 500;
//Full rotation (2 pi) = 500 * 183 = 91500
//Per position: 91500/11 = 8318.18 ticks

/**
 * Constructor for the Carousel
 */
Carousel::Carousel()
{
  std::string usbAddress = "/dev/ttyUSB0";
  
  // usb_address = "i:0x0403:0x6001" / "/dev/ttyUSB0"
  LxSerial *serial_port = new LxSerial();
  CDxlConfig *config = new CDxlConfig();

  printf("Setting up serial port...\n");
  serial_port->port_open(usbAddress, LxSerial::RS485_FTDI);
  serial_port->set_speed(LxSerial::S921600);
  
  motor = new C3mxl();
  motor->setSerialPort(serial_port);
  motor->setConfig(config->setID(107));

  // Setting the motor to PWM mode
  motor->setEncoderCountMotor(encoder_count);
  motor->setGearboxRatioMotor(ratio);
  motor->set3MxlMode(PWM_MODE);
  
  printf("Initializing...\n");
  while(motor->init(true) != DXL_SUCCESS) 
  {
    printf("Failed to init, trying again...\n");
    sleep(0.1);
  } 
  printf("Started!\n");

  SAFE_CALL(motor->setSpeed(1.f));
  sleep(1);
}

void Carousel::setSpeed(double speed)
{
  SAFE_CALL(motor->setSpeed(speed));
}

void Carousel::setPosition(double pos, double v, double a)
{
  SAFE_CALL(motor->setPos(pos, v, a));
}

double Carousel::getPosition()
{
  return motor->getPos();
}
