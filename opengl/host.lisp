;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.4/compound/61/LISPopengl/RCS/host.lisp,v 1.4.3.1 2003/02/26 21:56:32 davef Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.


(in-package "USER")

(setf (logical-pathname-translations "OPENGL")
      `(("**;*" ,(merge-pathnames "**/*" (pathname-location *load-truename*)))))

