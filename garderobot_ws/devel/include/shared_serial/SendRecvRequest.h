// Generated by gencpp from file shared_serial/SendRecvRequest.msg
// DO NOT EDIT!


#ifndef SHARED_SERIAL_MESSAGE_SENDRECVREQUEST_H
#define SHARED_SERIAL_MESSAGE_SENDRECVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace shared_serial
{
template <class ContainerAllocator>
struct SendRecvRequest_
{
  typedef SendRecvRequest_<ContainerAllocator> Type;

  SendRecvRequest_()
    : socket(0)
    , send_data()
    , length(0)
    , recv_timeout(0.0)
    , sock_timeout(0.0)  {
    }
  SendRecvRequest_(const ContainerAllocator& _alloc)
    : socket(0)
    , send_data(_alloc)
    , length(0)
    , recv_timeout(0.0)
    , sock_timeout(0.0)  {
  (void)_alloc;
    }



   typedef uint32_t _socket_type;
  _socket_type socket;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _send_data_type;
  _send_data_type send_data;

   typedef uint32_t _length_type;
  _length_type length;

   typedef float _recv_timeout_type;
  _recv_timeout_type recv_timeout;

   typedef float _sock_timeout_type;
  _sock_timeout_type sock_timeout;




  typedef boost::shared_ptr< ::shared_serial::SendRecvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::shared_serial::SendRecvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SendRecvRequest_

typedef ::shared_serial::SendRecvRequest_<std::allocator<void> > SendRecvRequest;

typedef boost::shared_ptr< ::shared_serial::SendRecvRequest > SendRecvRequestPtr;
typedef boost::shared_ptr< ::shared_serial::SendRecvRequest const> SendRecvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::shared_serial::SendRecvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::shared_serial::SendRecvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace shared_serial

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'shared_serial': ['/home/nilshullegien/Garderobot/garderobot_ws/src/shared_serial/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::shared_serial::SendRecvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::shared_serial::SendRecvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::shared_serial::SendRecvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3fa8cb9d9b17970f1ef94f8b72f437be";
  }

  static const char* value(const ::shared_serial::SendRecvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3fa8cb9d9b17970fULL;
  static const uint64_t static_value2 = 0x1ef94f8b72f437beULL;
};

template<class ContainerAllocator>
struct DataType< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "shared_serial/SendRecvRequest";
  }

  static const char* value(const ::shared_serial::SendRecvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
\n\
\n\
uint32  socket\n\
\n\
\n\
uint8[] send_data\n\
\n\
\n\
uint32  length\n\
\n\
\n\
float32 recv_timeout\n\
\n\
\n\
float32 sock_timeout\n\
\n\
";
  }

  static const char* value(const ::shared_serial::SendRecvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.socket);
      stream.next(m.send_data);
      stream.next(m.length);
      stream.next(m.recv_timeout);
      stream.next(m.sock_timeout);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SendRecvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::shared_serial::SendRecvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::shared_serial::SendRecvRequest_<ContainerAllocator>& v)
  {
    s << indent << "socket: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.socket);
    s << indent << "send_data[]" << std::endl;
    for (size_t i = 0; i < v.send_data.size(); ++i)
    {
      s << indent << "  send_data[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.send_data[i]);
    }
    s << indent << "length: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.length);
    s << indent << "recv_timeout: ";
    Printer<float>::stream(s, indent + "  ", v.recv_timeout);
    s << indent << "sock_timeout: ";
    Printer<float>::stream(s, indent + "  ", v.sock_timeout);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SHARED_SERIAL_MESSAGE_SENDRECVREQUEST_H
