;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.4/compound/61/LISPopengl/RCS/defsys.lisp,v 1.11.2.2 2003/06/16 10:43:43 martin Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.

(in-package "USER")

(pushnew :use-fli-gl-vector sys::*features*)

(defsystem "OPENGL" 
  (:optimize ((debug 3) (safety 3)))
  :members ( "pkg"
             "constants"
             "types"
             "vectors"
             "fns"
             ("xfns" :features :ffi-x11)
             ("win32" :features :win32)
             "ufns"
             "capi"
             ("xm-lib" :features :ffi-x11)
             ("msw-lib" :features :win32)
             ("cocoa" :features :cocoa)
   
             "loader"
             )
  :rules ((:in-order-to :load :all
           (:requires (:load :serial)))
          (:in-order-to :compile :all 
           (:caused-by (:compile :previous))
           (:requires (:load :serial))))
  )

    

