;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(defpackage #:cl-sndfile
  (:use :cl :cffi))

(in-package :cl-sndfile)

(define-foreign-library libsndfile
    (:unix (:or "libsndfile.so.1" "libsndfile.so"))
    (t (:default "libsndfile")))

(use-foreign-library libsndfile)
