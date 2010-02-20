;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(in-package #:cl-sndfile)

(defconstant +buflen+ (ash 1 16))

(defun sndfile-get-info (path)
  (declare (string path))
  (with-foreign-object (ptr 'sf-info)
    (with-foreign-string (_path path)
      (let ((fptr (sf-open _path +sfm-read+ ptr)))
	(when (cffi:null-pointer-p fptr)
	  (error "Null pointer returned.~%"))
	(when (zerop (sf-format-check ptr))
	  (error "~a~%" (sf-strerror fptr)))
	(with-foreign-pointer-as-string (strptr +buflen+)
	  (sf-command fptr +sfc-get-log-info+ strptr +buflen+)
	  (format t "Strbuf: ~s~%" (foreign-string-to-lisp strptr))
	  (with-foreign-slots ((samplerate frames channels format sections seekable)
			       ptr sf-info)
	    (format t "________________________________________~%")
	    (format t "Sample rate : ~d~%" samplerate)
	    (format t "Frames      : ~d~%" frames)
	    (format t "Channels    : ~d~%" channels)
	    (format t "Format      : ~x~%" format)
	    (format t "Sections    : ~d~%" sections)
	    (format t "Seekable    : ~A~%" (not (zerop seekable)))))))))

;;(sndfile-get-info "/tmp/1.ogg")
