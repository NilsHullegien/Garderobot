; Auto-generated. Do not edit!


(cl:in-package shared_serial-srv)


;//! \htmlinclude SendTo-request.msg.html

(cl:defclass <SendTo-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SendTo-request (<SendTo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendTo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendTo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-srv:<SendTo-request> is deprecated: use shared_serial-srv:SendTo-request instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <SendTo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:socket-val is deprecated.  Use shared_serial-srv:socket instead.")
  (socket m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendTo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:data-val is deprecated.  Use shared_serial-srv:data instead.")
  (data m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <SendTo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:timeout-val is deprecated.  Use shared_serial-srv:timeout instead.")
  (timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendTo-request>) ostream)
  "Serializes a message object of type '<SendTo-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendTo-request>) istream)
  "Deserializes a message object of type '<SendTo-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendTo-request>)))
  "Returns string type for a service object of type '<SendTo-request>"
  "shared_serial/SendToRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendTo-request)))
  "Returns string type for a service object of type 'SendTo-request"
  "shared_serial/SendToRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendTo-request>)))
  "Returns md5sum for a message object of type '<SendTo-request>"
  "75eda458a6ce0f610e2fd03d38f2a444")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendTo-request)))
  "Returns md5sum for a message object of type 'SendTo-request"
  "75eda458a6ce0f610e2fd03d38f2a444")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendTo-request>)))
  "Returns full string definition for message of type '<SendTo-request>"
  (cl:format cl:nil "~%~%~%~%uint32  socket~%~%~%uint8[] data~%~%~%float32 timeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendTo-request)))
  "Returns full string definition for message of type 'SendTo-request"
  (cl:format cl:nil "~%~%~%~%uint32  socket~%~%~%uint8[] data~%~%~%float32 timeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendTo-request>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendTo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendTo-request
    (cl:cons ':socket (socket msg))
    (cl:cons ':data (data msg))
    (cl:cons ':timeout (timeout msg))
))
;//! \htmlinclude SendTo-response.msg.html

(cl:defclass <SendTo-response> (roslisp-msg-protocol:ros-message)
  ((socket
    :reader socket
    :initarg :socket
    :type cl:integer
    :initform 0))
)

(cl:defclass SendTo-response (<SendTo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendTo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendTo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-srv:<SendTo-response> is deprecated: use shared_serial-srv:SendTo-response instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <SendTo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:socket-val is deprecated.  Use shared_serial-srv:socket instead.")
  (socket m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendTo-response>) ostream)
  "Serializes a message object of type '<SendTo-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendTo-response>) istream)
  "Deserializes a message object of type '<SendTo-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'socket)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'socket)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendTo-response>)))
  "Returns string type for a service object of type '<SendTo-response>"
  "shared_serial/SendToResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendTo-response)))
  "Returns string type for a service object of type 'SendTo-response"
  "shared_serial/SendToResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendTo-response>)))
  "Returns md5sum for a message object of type '<SendTo-response>"
  "75eda458a6ce0f610e2fd03d38f2a444")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendTo-response)))
  "Returns md5sum for a message object of type 'SendTo-response"
  "75eda458a6ce0f610e2fd03d38f2a444")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendTo-response>)))
  "Returns full string definition for message of type '<SendTo-response>"
  (cl:format cl:nil "~%~%uint32  socket~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendTo-response)))
  "Returns full string definition for message of type 'SendTo-response"
  (cl:format cl:nil "~%~%uint32  socket~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendTo-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendTo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendTo-response
    (cl:cons ':socket (socket msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendTo)))
  'SendTo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendTo)))
  'SendTo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendTo)))
  "Returns string type for a service object of type '<SendTo>"
  "shared_serial/SendTo")