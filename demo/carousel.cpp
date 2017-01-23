#include <math.h>
#include "threemxl/C3mxl.h"
#include "threemxl/LxFTDI.h"

#include <boost/python.hpp>

struct Carousel
{
  Carousel(std::string usb_address)
    {
      float ratio = 183;
      WORD encoder_count = 500;
      double wheel_diameter = 0.7;

      LxSerial *serial_port = new LxSerial();
      CDxlConfig *config = new CDxlConfig();

      printf("Setting up serial port...\n");
      serial_port->port_open(usb_address, LxSerial::RS485_FTDI);
      serial_port->set_speed(LxSerial::S921600);
      
      motor = new C3mxl();
      motor->setSerialPort(serial_port);
      motor->setConfig(config->setID(107));

      // Setting the motor to PWM mode
      motor->setEncoderCountMotor(encoder_count);
      motor->setEncoderCountJoint((WORD)encoder_count * ratio);
      motor->setGearboxRatioMotor(ratio);
      motor->setWheelDiameter(wheel_diameter);
      motor->setEncoderIndexLevelMotor(1);

      printf("Initializing...\n");
      while(motor->init(false) != DXL_SUCCESS)
      {
        printf("Failed to init, trying again...\n");
        sleep(0.1);
      }
    }
  void external_init(double speed, double acc, double torque)
    {
      motor->set3MxlMode(EXTERNAL_INIT);
      motor->setSpeed(1);
      motor->setAcceleration(1);
      motor->setTorque(1);
    }
  void set_speed_mode()
    {
      motor->set3MxlMode(SPEED_MODE);
    }
  void set_speed_acc_torque(double speed, double acc, double torque)
    {
      motor->setSpeed(speed);
      motor->setAcceleration(acc);
      motor->setTorque(torque);
    }
  double get_position()
    {
      motor->getPos();
      return motor->presentPos();
    }
  std::string test()
    {
      return "Blijkbaar werkt dit dus, je kan naar huis.";
    }

  C3mxl *motor;
};

using namespace boost::python;

BOOST_PYTHON_MODULE(carousel)
{
  class_<Carousel>("Carousel", init<std::string>())
    .def("external_init", &Carousel::external_init)
    .def("set_speed_mode", &Carousel::set_speed_mode)
    .def("set_speed_acc_torque", &Carousel::set_speed_acc_torque)
    .def("get_position", &Carousel::get_position)
    .def("test", &Carousel::test)
  ;
};
