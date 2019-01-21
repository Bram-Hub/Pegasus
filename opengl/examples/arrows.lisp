;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.1/compound/9/LISPopengl-examples/RCS/arrows.lisp,v 1.5.2.1 2003/02/26 21:56:35 davef Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.

(in-package "USER")

;;; ----------------------------------------------------------------------
;;; Load up the required generic images use #. reader syntax to embed the
;;; images within the fasl.
;;; ----------------------------------------------------------------------


(eval-when (compile eval)
  (defmacro register-button-image (pathname)
    (gp:read-external-image (merge-pathnames pathname (or #+LUCID *compile-file-pathname*
                                                          (current-pathname))))))


(defvar *down-arrow* #.(register-button-image #p"./images/down-arrow.bmp"))
(defvar *up-arrow* #.(register-button-image #p"./images/up-arrow.bmp"))
(defvar *up-disabled* #.(register-button-image #p"./images/up-disabled.bmp"))
(defvar *down-disabled* #.(register-button-image #p"./images/down-disabled.bmp"))

(setf (gp:external-image-transparent-color-index *down-arrow*) 0
      (gp:external-image-transparent-color-index *up-arrow*) 0
      (gp:external-image-transparent-color-index *up-disabled*) 0
      (gp:external-image-transparent-color-index *down-disabled*) 0)
