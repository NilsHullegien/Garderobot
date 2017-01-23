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

      // Setting the motor to PWM mode
      // motor->setEncoderCountMotor(encoder_count);
      // motor->setGearboxRatioMotor(ratio);
      // motor->setWheelDiameter(wheel_diameter);
      // motor->setEncoderIndexLevelMotor(1);

      motor->setConfig(config->setID(107));

      printf("Initializing...\n");
      while(motor->init(true) != DXL_SUCCESS)
      {
        printf("Failed to init, trying again...\n");
        sleep(0.1);
      }
    }
  void external_init()
    {
      motor->set3MxlMode(EXTERNAL_INIT);
      motor->setSpeed(0.1);
      motor->setAcceleration(0.1);
      motor->setTorque(0);
      motor->setPWM(0.2);
    }
  void set_speed_mode()
    {
      motor->set3MxlMode(SPEED_MODE);
    }
  void set_pwm_mode()
    {
      motor->set3MxlMode(PWM_MODE);
    }
  void set_speed(double speed)
    {
      motor->setSpeed(speed);
    }
  void set_acceleration(double acc)
    {
      motor->setAcceleration(acc);
    }
  void set_torque(double torque)
    {
      motor->setTorque(torque);
    }
  void set_pwm(double width)
    {
      motor->setPWM(width);
    }
  double get_position()
    {
      motor->getPos();
      return motor->presentPos();
    }
  double get_speed()
    {
      motor->getPosAndSpeed();
      return motor->presentSpeed();
    }
  double get_acceleration()
    {
      motor->getPosAndSpeed();
      return motor->presentAcceleration();
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
    .def("set_pwm_mode", &Carousel::set_pwm_mode)
    .def("set_speed", &Carousel::set_speed)
    .def("set_acceleration", &Carousel::set_acceleration)
    .def("set_torque", &Carousel::set_torque)
    .def("set_pwm", &Carousel::set_pwm)
    .def("get_position", &Carousel::get_position)
    .def("get_speed", &Carousel::get_speed)
    .def("get_acceleration", &Carousel::get_acceleration)
    .def("test", &Carousel::test)
  ;
};
