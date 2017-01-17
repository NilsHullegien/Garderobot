; Auto-generated. Do not edit!


(cl:in-package shared_serial-msg)


;//! \htmlinclude Close.msg.html

(cl:defclass <Close> (roslisp-msg-protocol:ros-message)
  ((socket
    :reader socket
    :initarg :socket
    :type cl:integer
    :initform 0))
)

(cl:defclass Close (<Close>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Close>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Close)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-msg:<Close> is deprecated: use shared_serial-msg:Close instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <Close>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-msg:socket-val is deprecated.  Use shared_serial-msg:socket instead.")
  (socket m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Close>) ostream)
  "Serializes a message object of type '<Close>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Close>) istream)
  "Deserializes a message object of type '<Close>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Close>)))
  "Returns string type for a message object of type '<Close>"
  "shared_serial/Close")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Close)))
  "Returns string type for a message object of type 'Close"
  "shared_serial/Close")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Close>)))
  "Returns md5sum for a message object of type '<Close>"
  "82ff2df0785f8985963dadf1a996d34e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Close)))
  "Returns md5sum for a message object of type 'Close"
  "82ff2df0785f8985963dadf1a996d34e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Close>)))
  "Returns full string definition for message of type '<Close>"
  (cl:format cl:nil "# Release serial port lock.~%~%# Socket identifier from an earlier communication.~%uint32 socket~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Close)))
  "Returns full string definition for message of type 'Close"
  (cl:format cl:nil "# Release serial port lock.~%~%# Socket identifier from an earlier communication.~%uint32 socket~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Close>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Close>))
  "Converts a ROS message object to a list"
  (cl:list 'Close
    (cl:cons ':socket (socket msg))
))
