;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.4/compound/61/LISPopengl/RCS/capi.lisp,v 1.15.1.2 2003/06/16 10:46:54 martin Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.


(in-package "OPENGL")

;; This eases the following modification of CAPI package
(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf *packages-for-warn-on-redefinition* 
        (delete "CAPI" *packages-for-warn-on-redefinition* :test 'string=))
  )

(export 'capi::opengl-pane :CAPI)

(defparameter *open-gl-debug* nil)

(defun debug-print (format-string &rest args)
  (when *open-gl-debug*
    (format *terminal-io* "~?" format-string args)))

(defvar *default-opengl-pane-configuration* (list :rgba t))

(capi::define-element capi:opengl-pane (capi:output-pane)
  ((configuration :initform *default-opengl-pane-configuration*
                  :initarg :configuration
                  :reader configuration)
   (context :initform nil :initarg :context :accessor context)))

(defun ensure-context (opengl-pane)
  (or (context opengl-pane)
      (setf (context opengl-pane)
            (%make-context (capi-internals:representation opengl-pane)
                           (configuration opengl-pane)))))
  
(defmethod swap-buffers ((opengl-pane capi::opengl-pane))
  (%swap-buffers (capi-internals:representation opengl-pane)
                 (context opengl-pane)))

(defmethod describe-configuration ((opengl-pane capi::opengl-pane)
                                   &optional
                                   (stream *standard-output*)
                                   collectp)
  (%describe-configuration (capi-internals:representation opengl-pane)
                           (context opengl-pane)
                           stream collectp))

;;; ------------------------------------------------------------
;;; Locking
;;; One GL context is current at any time, so we need a locking mechanism to stop
;;; thread interfering with each other.

(defvar *current-opengl-window* nil)

(defvar *opengl-window-lock* (mp:make-lock :name "OpenGL"))
    
(defun force-OpenGL-lock ()
  (mp:release-lock *opengl-window-lock*))

(defun process-has-openGL-lock-p (&optional (process mp:*current-process*))
  (eq (mp:lock-owner *opengl-window-lock*) process))

(defun process-with-openGL-lock ()
  (mp:lock-owner *opengl-window-lock*))

(defmethod start-rendering ((opengl-pane capi::opengl-pane))
  "Cause future OpenGL rendering calls to go to this window.
   This function takes care of MP locking."
  (let ((rep (capi-internals:representation opengl-pane)))
    (when rep
      (let ((context (ensure-context opengl-pane)))
    
        ;; If the process already has the lock, it may be a recursive call or a reentrant call.
        ;; Recursive calls are okay.  Reentrant call arise only when the previous call failed to
        ;; set the *current-opengl-window* which means an error occurred, so just return.
        (if (process-has-openGL-lock-p)
            (cond ((null *current-opengl-window*)
                   (debug-print "OpenGL error: Reentrant call to start-rendering in process: ~s" rep)
                   (return-from start-rendering (values nil)))
                  ((not (eq *current-opengl-window* rep))
                   (debug-print "OpenGL error: Nested call to start-rendering on different window: current : ~s, requested ~s" 
	                        *current-opengl-window* rep)
                   (return-from start-rendering (values nil)))               
                  (t t))
    
          (progn
	    (mp:process-lock *opengl-window-lock*)
	    (setf *current-opengl-window* rep)
	    (if (%start-rendering rep context)
		:lock
              (progn
		(%stop-rendering (capi-internals:representation opengl-pane))
                (debug-print "openGL error: Failed to set current OpenGL context for ~s" (capi-internals:representation opengl-pane))
		nil))))))))

(defmethod stop-rendering ((opengl-pane capi::opengl-pane))
  (%stop-rendering (capi-internals:representation opengl-pane))
  (setf *current-opengl-window* nil)
  (mp:process-unlock *opengl-window-lock*))

(eval-when (:compile-toplevel :load-toplevel :execute)
(defmacro rendering-on ((opengl-pane) &body body)
  (let ((rep (gensym))
        (lock (gensym)))
    `(let ((,rep (capi-internals:representation ,opengl-pane)))
       (when ,rep
         (let (,lock)
           (unwind-protect
               (progn 
                 (setf ,lock (start-rendering ,opengl-pane))
                 (when ,lock                        ; lock is :lock or T. T when nested rendering on same window
                   ,@body))
             (when (eq ,lock :lock)  ; when start-rendering returned the lock, unlock.
               (stop-rendering ,opengl-pane)))))))))

(defmethod capi-internals:representation-destroy :before ((opengl-pane capi::opengl-pane))
  (%free-opengl-resources (capi-internals:representation opengl-pane) (context opengl-pane)))

(defmethod capi::output-pane-resize :before ((opengl-pane capi::opengl-pane)
                                             x y width height)
  (%resize-opengl-context (capi-internals:representation opengl-pane)
                          (context opengl-pane)
                          width height))

(eval-when (:compile-toplevel :load-toplevel :execute)
(defmacro with-matrix-pushed (&body body)
  `(progn                   ;; unwind-protect has several instructions overhead
     (gl-push-matrix)
     ,@body
     (gl-pop-matrix))))
  

#|| Example of basic interface:
(capi:define-interface opengl-interface ()
  ()
  (:panes (opengl capi:opengl-pane :configuration (list :rgba t)))
  (:layouts 
   (main capi:column-layout '(opengl) :default t)))
||#
