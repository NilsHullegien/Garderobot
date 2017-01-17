; Auto-generated. Do not edit!


(cl:in-package shared_serial-msg)


;//! \htmlinclude Send.msg.html

(cl:defclass <Send> (roslisp-msg-protocol:ros-message)
  ((socket
    :reader socket
    :initarg :socket
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (timeout
    :reader timeout
    :initarg :timeout
    :type cl:float
    :initform 0.0))
)

(cl:defclass Send (<Send>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Send>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Send)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-msg:<Send> is deprecated: use shared_serial-msg:Send instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-msg:socket-val is deprecated.  Use shared_serial-msg:socket instead.")
  (socket m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-msg:data-val is deprecated.  Use shared_serial-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <Send>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-msg:timeout-val is deprecated.  Use shared_serial-msg:timeout instead.")
  (timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Send>) ostream)
  "Serializes a message object of type '<Send>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Send>) istream)
  "Deserializes a message object of type '<Send>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeout) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Send>)))
  "Returns string type for a message object of type '<Send>"
  "shared_serial/Send")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Send)))
  "Returns string type for a message object of type 'Send"
  "shared_serial/Send")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Send>)))
  "Returns md5sum for a message object of type '<Send>"
  "9488c54395f85f0662ca59801f32b45a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Send)))
  "Returns md5sum for a message object of type 'Send"
  "9488c54395f85f0662ca59801f32b45a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Send>)))
  "Returns full string definition for message of type '<Send>"
  (cl:format cl:nil "# Send data to serial port.~%~%# Eeither 0 (connectionless) or an unexpired socket identifier~%# from an earlier communication.~%uint32  socket~%~%# Data to be sent.~%uint8[] data~%~%# Number of seconds to keep the port locked after this communication.~%float32 timeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Send)))
  "Returns full string definition for message of type 'Send"
  (cl:format cl:nil "# Send data to serial port.~%~%# Eeither 0 (connectionless) or an unexpired socket identifier~%# from an earlier communication.~%uint32  socket~%~%# Data to be sent.~%uint8[] data~%~%# Number of seconds to keep the port locked after this communication.~%float32 timeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Send>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Send>))
  "Converts a ROS message object to a list"
  (cl:list 'Send
    (cl:cons ':socket (socket msg))
    (cl:cons ':data (data msg))
    (cl:cons ':timeout (timeout msg))
))
