; Auto-generated. Do not edit!


(cl:in-package shared_serial-msg)


;//! \htmlinclude Flush.msg.html

(cl:defclass <Flush> (roslisp-msg-protocol:ros-message)
  ((socket
    :reader socket
    :initarg :socket
    :type cl:integer
    :initform 0)
   (timeout
    :reader timeout
    :initarg :timeout
    :type cl:float
    :initform 0.0))
)

(cl:defclass Flush (<Flush>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Flush>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Flush)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-msg:<Flush> is deprecated: use shared_serial-msg:Flush instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <Flush>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-msg:socket-val is deprecated.  Use shared_serial-msg:socket instead.")
  (socket m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <Flush>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-msg:timeout-val is deprecated.  Use shared_serial-msg:timeout instead.")
  (timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Flush>) ostream)
  "Serializes a message object of type '<Flush>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Flush>) istream)
  "Deserializes a message object of type '<Flush>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeout) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Flush>)))
  "Returns string type for a message object of type '<Flush>"
  "shared_serial/Flush")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Flush)))
  "Returns string type for a message object of type 'Flush"
  "shared_serial/Flush")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Flush>)))
  "Returns md5sum for a message object of type '<Flush>"
  "998caebd95b1820bc38f9812484a09de")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Flush)))
  "Returns md5sum for a message object of type 'Flush"
  "998caebd95b1820bc38f9812484a09de")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Flush>)))
  "Returns full string definition for message of type '<Flush>"
  (cl:format cl:nil "# Flush serial port.~%~%# Eeither 0 (connectionless) or an unexpired socket identifier~%# from an earlier communication.~%uint32 socket~%~%# Number of seconds to keep the port locked after this communication.~%float32 timeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Flush)))
  "Returns full string definition for message of type 'Flush"
  (cl:format cl:nil "# Flush serial port.~%~%# Eeither 0 (connectionless) or an unexpired socket identifier~%# from an earlier communication.~%uint32 socket~%~%# Number of seconds to keep the port locked after this communication.~%float32 timeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Flush>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Flush>))
  "Converts a ROS message object to a list"
  (cl:list 'Flush
    (cl:cons ':socket (socket msg))
    (cl:cons ':timeout (timeout msg))
))
