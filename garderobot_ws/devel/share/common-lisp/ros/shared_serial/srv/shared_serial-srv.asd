
(cl:in-package :asdf)

(defsystem "shared_serial-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SendTo" :depends-on ("_package_SendTo"))
    (:file "_package_SendTo" :depends-on ("_package"))
    (:file "Connect" :depends-on ("_package_Connect"))
    (:file "_package_Connect" :depends-on ("_package"))
    (:file "Recv" :depends-on ("_package_Recv"))
    (:file "_package_Recv" :depends-on ("_package"))
    (:file "SendRecv" :depends-on ("_package_SendRecv"))
    (:file "_package_SendRecv" :depends-on ("_package"))
  ))