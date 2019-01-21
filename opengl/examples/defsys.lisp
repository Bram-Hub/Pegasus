;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.1/compound/9/LISPopengl-examples/RCS/defsys.lisp,v 1.15.2.1 2003/02/26 21:56:36 davef Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.


(in-package "CL-USER")

(defsystem "OPENGL-EXAMPLES"
  ()
  :members
  (("OPENGL" :type :system :root-module nil)
   "arrows"
   "icosahedron"
   "texture"
   "3d-text")
  :rules
  ((:in-order-to :compile :all (:requires (:load "OPENGL")))
   (:in-order-to :compile "icosahedron" (:requires (:load "arrows")))
   ))

