
(cl:in-package :asdf)

(defsystem "shared_serial-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Send" :depends-on ("_package_Send"))
    (:file "_package_Send" :depends-on ("_package"))
    (:file "Flush" :depends-on ("_package_Flush"))
    (:file "_package_Flush" :depends-on ("_package"))
    (:file "Close" :depends-on ("_package_Close"))
    (:file "_package_Close" :depends-on ("_package"))
  ))