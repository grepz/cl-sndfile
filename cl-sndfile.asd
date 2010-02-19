
(defpackage #:cl-sndfile-asd
  (:use :cl :asdf))

(in-package :cl-sndfile-asd)

(defsystem cl-sndfile
    :version "0"
    :description ""
    :maintainer "Stanislav M. Ivankin <stas@concat.info>"
    :author "Stanislav M. Ivankin <stas@concat.info>"
    :licence "GPL"
    :depends-on (cffi)
    :serial t
    ;; components likely need manual reordering
    :components ((:module src
			  :components ((:file "sndfile")
				       (:file "cl-sndfile-swig"
					      :depends-on ("sndfile"))
				       (:module utils
						:components ((:file "sndfile-info"))
						:depends-on ("cl-sndfile-swig")))))
    ;; :long-description ""
    )
