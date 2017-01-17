; Auto-generated. Do not edit!


(cl:in-package shared_serial-srv)


;//! \htmlinclude SendRecv-request.msg.html

(cl:defclass <SendRecv-request> (roslisp-msg-protocol:ros-message)
  ((socket
    :reader socket
    :initarg :socket
    :type cl:integer
    :initform 0)
   (send_data
    :reader send_data
    :initarg :send_data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (length
    :reader length
    :initarg :length
    :type cl:integer
    :initform 0)
   (recv_timeout
    :reader recv_timeout
    :initarg :recv_timeout
    :type cl:float
    :initform 0.0)
   (sock_timeout
    :reader sock_timeout
    :initarg :sock_timeout
    :type cl:float
    :initform 0.0))
)

(cl:defclass SendRecv-request (<SendRecv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendRecv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendRecv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-srv:<SendRecv-request> is deprecated: use shared_serial-srv:SendRecv-request instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <SendRecv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:socket-val is deprecated.  Use shared_serial-srv:socket instead.")
  (socket m))

(cl:ensure-generic-function 'send_data-val :lambda-list '(m))
(cl:defmethod send_data-val ((m <SendRecv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:send_data-val is deprecated.  Use shared_serial-srv:send_data instead.")
  (send_data m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <SendRecv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:length-val is deprecated.  Use shared_serial-srv:length instead.")
  (length m))

(cl:ensure-generic-function 'recv_timeout-val :lambda-list '(m))
(cl:defmethod recv_timeout-val ((m <SendRecv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:recv_timeout-val is deprecated.  Use shared_serial-srv:recv_timeout instead.")
  (recv_timeout m))

(cl:ensure-generic-function 'sock_timeout-val :lambda-list '(m))
(cl:defmethod sock_timeout-val ((m <SendRecv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:sock_timeout-val is deprecated.  Use shared_serial-srv:sock_timeout instead.")
  (sock_timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendRecv-request>) ostream)
  "Serializes a message object of type '<SendRecv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'send_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'send_data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'recv_timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sock_timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendRecv-request>) istream)
  "Deserializes a message object of type '<SendRecv-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'send_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'send_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'recv_timeout) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sock_timeout) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendRecv-request>)))
  "Returns string type for a service object of type '<SendRecv-request>"
  "shared_serial/SendRecvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendRecv-request)))
  "Returns string type for a service object of type 'SendRecv-request"
  "shared_serial/SendRecvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendRecv-request>)))
  "Returns md5sum for a message object of type '<SendRecv-request>"
  "4e5eaed6bdc293cf0a00d420ba4ecbb2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendRecv-request)))
  "Returns md5sum for a message object of type 'SendRecv-request"
  "4e5eaed6bdc293cf0a00d420ba4ecbb2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendRecv-request>)))
  "Returns full string definition for message of type '<SendRecv-request>"
  (cl:format cl:nil "~%~%~%~%uint32  socket~%~%~%uint8[] send_data~%~%~%uint32  length~%~%~%float32 recv_timeout~%~%~%float32 sock_timeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendRecv-request)))
  "Returns full string definition for message of type 'SendRecv-request"
  (cl:format cl:nil "~%~%~%~%uint32  socket~%~%~%uint8[] send_data~%~%~%uint32  length~%~%~%float32 recv_timeout~%~%~%float32 sock_timeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendRecv-request>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'send_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendRecv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendRecv-request
    (cl:cons ':socket (socket msg))
    (cl:cons ':send_data (send_data msg))
    (cl:cons ':length (length msg))
    (cl:cons ':recv_timeout (recv_timeout msg))
    (cl:cons ':sock_timeout (sock_timeout msg))
))
;//! \htmlinclude SendRecv-response.msg.html

(cl:defclass <SendRecv-response> (roslisp-msg-protocol:ros-message)
  ((socket
    :reader socket
    :initarg :socket
    :type cl:integer
    :initform 0)
   (recv_data
    :reader recv_data
    :initarg :recv_data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass SendRecv-response (<SendRecv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendRecv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendRecv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-srv:<SendRecv-response> is deprecated: use shared_serial-srv:SendRecv-response instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <SendRecv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:socket-val is deprecated.  Use shared_serial-srv:socket instead.")
  (socket m))

(cl:ensure-generic-function 'recv_data-val :lambda-list '(m))
(cl:defmethod recv_data-val ((m <SendRecv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:recv_data-val is deprecated.  Use shared_serial-srv:recv_data instead.")
  (recv_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendRecv-response>) ostream)
  "Serializes a message object of type '<SendRecv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'recv_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'recv_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendRecv-response>) istream)
  "Deserializes a message object of type '<SendRecv-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'recv_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'recv_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendRecv-response>)))
  "Returns string type for a service object of type '<SendRecv-response>"
  "shared_serial/SendRecvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendRecv-response)))
  "Returns string type for a service object of type 'SendRecv-response"
  "shared_serial/SendRecvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendRecv-response>)))
  "Returns md5sum for a message object of type '<SendRecv-response>"
  "4e5eaed6bdc293cf0a00d420ba4ecbb2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendRecv-response)))
  "Returns md5sum for a message object of type 'SendRecv-response"
  "4e5eaed6bdc293cf0a00d420ba4ecbb2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendRecv-response>)))
  "Returns full string definition for message of type '<SendRecv-response>"
  (cl:format cl:nil "~%~%uint32  socket~%~%~%uint8[] recv_data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendRecv-response)))
  "Returns full string definition for message of type 'SendRecv-response"
  (cl:format cl:nil "~%~%uint32  socket~%~%~%uint8[] recv_data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendRecv-response>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'recv_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendRecv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendRecv-response
    (cl:cons ':socket (socket msg))
    (cl:cons ':recv_data (recv_data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendRecv)))
  'SendRecv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendRecv)))
  'SendRecv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendRecv)))
  "Returns string type for a service object of type '<SendRecv>"
  "shared_serial/SendRecv")