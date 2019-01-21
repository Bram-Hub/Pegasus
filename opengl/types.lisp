;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.4/compound/61/LISPopengl/RCS/types.lisp,v 1.3.4.1 2003/02/26 21:56:33 davef Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.

(in-package "OPENGL")


(fli:define-c-typedef (glenum (:foreign-name "GLenum"))
  (:unsigned :int))

(fli:define-c-typedef (glboolean (:foreign-name "GLboolean"))
  (:unsigned :char))

(fli:define-c-typedef (glbitfield (:foreign-name "GLbitfield"))
  (:unsigned :int))

(fli:define-c-typedef (glbyte (:foreign-name "GLbyte"))
  (:signed :char))

(fli:define-c-typedef (glshort (:foreign-name "GLshort"))
  (:signed :short))

(fli:define-c-typedef (glint (:foreign-name "GLint"))
  (:signed :int))

(fli:define-c-typedef (glsizei (:foreign-name "GLsizei"))
  (:signed :int))

(fli:define-c-typedef (glubyte (:foreign-name "GLubyte"))
  (:unsigned :char))

(fli:define-c-typedef (glushort (:foreign-name "GLushort"))
  (:unsigned :short))

(fli:define-c-typedef (gluint (:foreign-name "GLuint"))
  (:unsigned :int))

(fli:define-c-typedef (glfloat (:foreign-name "GLfloat"))
  :float)

(fli:define-c-typedef (glclampf (:foreign-name "GLclampf"))
  :float)

(fli:define-c-typedef (gldouble (:foreign-name "GLdouble"))
  :double)

(fli:define-c-typedef (glclampd (:foreign-name "GLclampd"))
  :double)

(fli:define-c-typedef (glvoid (:foreign-name "GLvoid"))
  :void)


