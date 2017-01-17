; Auto-generated. Do not edit!


(cl:in-package shared_serial-srv)


;//! \htmlinclude Connect-request.msg.html

(cl:defclass <Connect-request> (roslisp-msg-protocol:ros-message)
  ((timeout
    :reader timeout
    :initarg :timeout
    :type cl:float
    :initform 0.0))
)

(cl:defclass Connect-request (<Connect-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Connect-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Connect-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-srv:<Connect-request> is deprecated: use shared_serial-srv:Connect-request instead.")))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <Connect-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:timeout-val is deprecated.  Use shared_serial-srv:timeout instead.")
  (timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Connect-request>) ostream)
  "Serializes a message object of type '<Connect-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Connect-request>) istream)
  "Deserializes a message object of type '<Connect-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeout) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Connect-request>)))
  "Returns string type for a service object of type '<Connect-request>"
  "shared_serial/ConnectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Connect-request)))
  "Returns string type for a service object of type 'Connect-request"
  "shared_serial/ConnectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Connect-request>)))
  "Returns md5sum for a message object of type '<Connect-request>"
  "0f077aa46d26c0b33419647f84d73b59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Connect-request)))
  "Returns md5sum for a message object of type 'Connect-request"
  "0f077aa46d26c0b33419647f84d73b59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Connect-request>)))
  "Returns full string definition for message of type '<Connect-request>"
  (cl:format cl:nil "~%~%~%float32 timeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Connect-request)))
  "Returns full string definition for message of type 'Connect-request"
  (cl:format cl:nil "~%~%~%float32 timeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Connect-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Connect-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Connect-request
    (cl:cons ':timeout (timeout msg))
))
;//! \htmlinclude Connect-response.msg.html

(cl:defclass <Connect-response> (roslisp-msg-protocol:ros-message)
  ((socket
    :reader socket
    :initarg :socket
    :type cl:integer
    :initform 0))
)

(cl:defclass Connect-response (<Connect-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Connect-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Connect-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_serial-srv:<Connect-response> is deprecated: use shared_serial-srv:Connect-response instead.")))

(cl:ensure-generic-function 'socket-val :lambda-list '(m))
(cl:defmethod socket-val ((m <Connect-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_serial-srv:socket-val is deprecated.  Use shared_serial-srv:socket instead.")
  (socket m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Connect-response>) ostream)
  "Serializes a message object of type '<Connect-response>"
  (cl:let* ((signed (cl:slot-value msg 'socket)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Connect-response>) istream)
  "Deserializes a message object of type '<Connect-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'socket) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Connect-response>)))
  "Returns string type for a service object of type '<Connect-response>"
  "shared_serial/ConnectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Connect-response)))
  "Returns string type for a service object of type 'Connect-response"
  "shared_serial/ConnectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Connect-response>)))
  "Returns md5sum for a message object of type '<Connect-response>"
  "0f077aa46d26c0b33419647f84d73b59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Connect-response)))
  "Returns md5sum for a message object of type 'Connect-response"
  "0f077aa46d26c0b33419647f84d73b59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Connect-response>)))
  "Returns full string definition for message of type '<Connect-response>"
  (cl:format cl:nil "~%~%int32   socket~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Connect-response)))
  "Returns full string definition for message of type 'Connect-response"
  (cl:format cl:nil "~%~%int32   socket~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Connect-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Connect-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Connect-response
    (cl:cons ':socket (socket msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Connect)))
  'Connect-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Connect)))
  'Connect-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Connect)))
  "Returns string type for a service object of type '<Connect>"
  "shared_serial/Connect")