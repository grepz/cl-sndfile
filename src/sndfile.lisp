;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(defpackage #:cl-sndfile
  (:use :cl :cffi))

(in-package :cl-sndfile)

(define-foreign-library libsndfile
    (:unix (:or "libsndfile.so.1" "libsndfile.so"))
    (t (:default "libsndfile")))

(use-foreign-library libsndfile)

;; (with-foreign-object (ptr 'sf-info)
;;   (let ((sf_file (sf-open "/tmp/1.wav" +sfm-read+ ptr)))
;;     (format t "Error: ~s~%" (sf-strerror sf_file))
;;     (format t "Valid? ~d~%" (sf-format-check ptr))
;;     (format t "Format: ~d~%" (foreign-slot-value ptr 'sf-info 'format))

;;     (format t "~A~%" sf_file)))
