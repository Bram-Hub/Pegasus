;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.4/compound/61/LISPopengl/RCS/loader.lisp,v 1.2.2.2 2003/06/16 10:44:07 martin Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.


(in-package "CL-USER")

;; Ensure a connection to the foreign OpenGL libraries.

(eval-when (load eval)
  #+Win32
  (progn
    (fli:register-module "OPENGL32" :connection-style :immediate)
    (fli:register-module "GLU32" :connection-style :immediate)
    )

  #+Linux
  (progn

    ;; Ideally libGL.so and libGLU.so would be loaded directly, but
    ;; there are problems most likely caused by libGLU.so not having
    ;; an SO_NEEDED dependency on libGL.so.  As a workaround, create a
    ;; combined file named /tmp/gl.so beforehand as follows:

    ;; $ cd /tmp; ld -shared -o gl.so -L/usr/X11R6/lib -lGLU -lGL -lm

    ;;(fli:register-module "/usr/X11R6/lib/libGL.so" :connection-style :immediate)
    ;;(fli:register-module "/usr/X11R6/lib/libGLU.so" :connection-style :immediate)

    (fli:register-module "/tmp/gl.so" :connection-style :immediate)
    )
  
  #+IRIX
  (foreign:read-foreign-modules "-lGLcore" "-lGL" "-lGLU" "-lX11")
  
  #+AIX
  (foreign:read-foreign-modules "-lGL" "-lGLU" "-lXext" "-lX11" "-lIM")

  #+Darwin
  (cond ((member :cocoa *features*)
         (let ((root "/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/"))
           (fli:register-module (merge-pathnames "libGL.dylib" root))
           (fli:register-module (merge-pathnames "libGLU.dylib" root))))
        ((member :ffi-x11 *features*)
         (let ((root "/usr/X11R6/lib/"))
           (fli:register-module (merge-pathnames "libGL.dylib" root))
           (fli:register-module (merge-pathnames "libGLU.dylib" root)))))
  )


