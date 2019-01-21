;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.4/compound/61/LISPopengl/RCS/fns.lisp,v 1.8.2.1 2003/02/26 21:56:34 davef Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.

(in-package "OPENGL")


(fli:define-foreign-function (gl-accum "glAccum" :source)
    ((op glenum) (value glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-alpha-func "glAlphaFunc" :source)
    ((func glenum) (ref glclampf))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-begin "glBegin" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-bitmap "glBitmap" :source)
    ((width glsizei)
     (height glsizei)
     (xorig glfloat)
     (yorig glfloat)
     (xmove glfloat)
     (ymove glfloat)
     (bitmap (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-blend-color-ext "glBlendColorEXT" :source)
    ((red glclampf)
     (green glclampf)
     (blue glclampf)
     (alpha glclampf))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-blend-equation-ext "glBlendEquationEXT" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-blend-func "glBlendFunc" :source)
    ((sfactor glenum) (dfactor glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-call-list "glCallList" :source)
    ((list gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-call-lists "glCallLists" :source)
    ((n glsizei)
     (type glenum)
     (lists gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-clear "glClear" :source)
    ((mask glbitfield))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-clear-accum "glClearAccum" :source)
    ((red glfloat)
     (green glfloat)
     (blue glfloat)
     (alpha glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-clear-color "glClearColor" :source)
    ((red glclampf)
     (green glclampf)
     (blue glclampf)
     (alpha glclampf))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-clear-depth "glClearDepth" :source)
    ((depth glclampd))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-clear-index "glClearIndex" :source)
    ((c glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-clear-stencil "glClearStencil" :source)
    ((s glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-clip-plane "glClipPlane" :source)
    ((plane glenum)
     (equation (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-b "glColor3b" :source)
    ((red glbyte) (green glbyte) (blue glbyte))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-bv "glColor3bv" :source)
    ((v (gl-vector :signed-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-d "glColor3d" :source)
    ((red gldouble) (green gldouble) (blue gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-dv "glColor3dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-f "glColor3f" :source)
    ((red glfloat) (green glfloat) (blue glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-fv "glColor3fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-i "glColor3i" :source)
    ((red glint) (green glint) (blue glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-iv "glColor3iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-s "glColor3s" :source)
    ((red glshort) (green glshort) (blue glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-sv "glColor3sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-ub "glColor3ub" :source)
    ((red glubyte) (green glubyte) (blue glubyte))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-ubv "glColor3ubv" :source)
    ((v (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-ui "glColor3ui" :source)
    ((red gluint) (green gluint) (blue gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-uiv "glColor3uiv" :source)
    ((v (gl-vector :unsigned-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-us "glColor3us" :source)
    ((red glushort) (green glushort) (blue glushort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color3-usv "glColor3usv" :source)
    ((v (gl-vector :unsigned-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-b "glColor4b" :source)
    ((red glbyte)
     (green glbyte)
     (blue glbyte)
     (alpha glbyte))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-bv "glColor4bv" :source)
    ((v (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-d "glColor4d" :source)
    ((red gldouble)
     (green gldouble)
     (blue gldouble)
     (alpha gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-dv "glColor4dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-f "glColor4f" :source)
    ((red glfloat)
     (green glfloat)
     (blue glfloat)
     (alpha glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-fv "glColor4fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-i "glColor4i" :source)
    ((red glint)
     (green glint)
     (blue glint)
     (alpha glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-iv "glColor4iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-s "glColor4s" :source)
    ((red glshort)
     (green glshort)
     (blue glshort)
     (alpha glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-sv "glColor4sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-ub "glColor4ub" :source)
    ((red glubyte)
     (green glubyte)
     (blue glubyte)
     (alpha glubyte))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-ubv "glColor4ubv" :source)
    ((v (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-ui "glColor4ui" :source)
    ((red gluint)
     (green gluint)
     (blue gluint)
     (alpha gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-uiv "glColor4uiv" :source)
    ((v (gl-vector :unsigned-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-us "glColor4us" :source)
    ((red glushort)
     (green glushort)
     (blue glushort)
     (alpha glushort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color4-usv "glColor4usv" :source)
    ((v (gl-vector :unsigned-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color-mask "glColorMask" :source)
    ((red glboolean)
     (green glboolean)
     (blue glboolean)
     (alpha glboolean))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-color-material "glColorMaterial" :source)
    ((face glenum) (mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-convolution-filter1-dext
                              "glConvolutionFilter1DEXT"
                              :source)
    ((target glenum)
     (internalformat glenum)
     (width glsizei)
     (format glenum)
     (type glenum)
     (image gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-convolution-filter2-dext
                              "glConvolutionFilter2DEXT"
                              :source)
    ((target glenum)
     (internalformat glenum)
     (width glsizei)
     (height glsizei)
     (format glenum)
     (type glenum)
     (image gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-convolution-parameterf-ext
                              "glConvolutionParameterfEXT"
                              :source)
    ((target glenum) (pname glenum) (params glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-convolution-parameterfv-ext
                              "glConvolutionParameterfvEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-convolution-parameteri-ext
                              "glConvolutionParameteriEXT"
                              :source)
    ((target glenum) (pname glenum) (params glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-convolution-parameteriv-ext
                              "glConvolutionParameterivEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-copy-convolution-filter1-dext
                              "glCopyConvolutionFilter1DEXT"
                              :source)
    ((target glenum)
     (internalformat glenum)
     (x glint)
     (y glint)
     (width glsizei))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-copy-convolution-filter2-dext
                              "glCopyConvolutionFilter2DEXT"
                              :source)
    ((target glenum)
     (internalformat glenum)
     (x glint)
     (y glint)
     (width glsizei)
     (height glsizei))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-copy-pixels "glCopyPixels" :source)
    ((x glint)
     (y glint)
     (width glsizei)
     (height glsizei)
     (type glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-cull-face "glCullFace" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-delete-lists "glDeleteLists" :source)
    ((list gluint) (range glsizei))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-depth-func "glDepthFunc" :source)
    ((func glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-depth-mask "glDepthMask" :source)
    ((flag glboolean))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-depth-range "glDepthRange" :source)
    ((near glclampd) (far glclampd))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-detail-tex-func-sgis
                              "glDetailTexFuncSGIS"
                              :source)
    ((target glenum)
     (n glsizei)
     (points (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-disable "glDisable" :source)
    ((cap glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-draw-buffer "glDrawBuffer" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-draw-pixels "glDrawPixels" :source)
    ((width glsizei)
     (height glsizei)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-edge-flag "glEdgeFlag" :source)
    ((flag glboolean))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-edge-flagv "glEdgeFlagv" :source)
    ((flag (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-enable "glEnable" :source)
    ((cap glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-end "glEnd" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-end-list "glEndList" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord1-d "glEvalCoord1d" :source)
    ((u gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord1-dv "glEvalCoord1dv" :source)
    ((u (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord1-f "glEvalCoord1f" :source)
    ((u glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord1-fv "glEvalCoord1fv" :source)
    ((u (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord2-d "glEvalCoord2d" :source)
    ((u gldouble) (v gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord2-dv "glEvalCoord2dv" :source)
    ((u (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord2-f "glEvalCoord2f" :source)
    ((u glfloat) (v glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-coord2-fv "glEvalCoord2fv" :source)
    ((u (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-mesh1 "glEvalMesh1" :source)
    ((mode glenum) (i1 glint) (i2 glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-mesh2 "glEvalMesh2" :source)
    ((mode glenum)
     (i1 glint)
     (i2 glint)
     (j1 glint)
     (j2 glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-point1 "glEvalPoint1" :source)
    ((i glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-eval-point2 "glEvalPoint2" :source)
    ((i glint) (j glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-feedback-buffer "glFeedbackBuffer" :source)
    ((size glsizei)
     (type glenum)
     (buffer (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-finish "glFinish" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-flush "glFlush" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-fogf "glFogf" :source)
    ((pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-fogfv "glFogfv" :source)
    ((pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-fogi "glFogi" :source)
    ((pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-fogiv "glFogiv" :source)
    ((pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-front-face "glFrontFace" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-frustum "glFrustum" :source)
    ((left gldouble)
     (right gldouble)
     (bottom gldouble)
     (top gldouble)
     (near gldouble)
     (far gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-gen-lists "glGenLists" :source)
    ((range glsizei))
  :result-type gluint
  :language :ansi-c)

(fli:define-foreign-function (gl-get-booleanv "glGetBooleanv" :source)
    ((pname glenum)
     (params (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-clip-plane "glGetClipPlane" :source)
    ((plane glenum)
     (equation (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-convolution-filter-ext
                              "glGetConvolutionFilterEXT"
                              :source)
    ((target glenum)
     (format glenum)
     (type glenum)
     (image gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-convolution-parameterfv-ext
                              "glGetConvolutionParameterfvEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-convolution-parameteriv-ext
                              "glGetConvolutionParameterivEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-detail-tex-func-sgis
                              "glGetDetailTexFuncSGIS"
                              :source)
    ((target glenum) (points (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-doublev "glGetDoublev" :source)
    ((pname glenum) (params (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-error "glGetError" :source)
    nil
  :result-type glenum
  :language :ansi-c)

(fli:define-foreign-function (gl-get-floatv "glGetFloatv" :source)
    ((pname glenum) (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-histogram-ext "glGetHistogramEXT" :source)
    ((target glenum)
     (reset glboolean)
     (format glenum)
     (type glenum)
     (values gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-histogram-parameterfv-ext
                              "glGetHistogramParameterfvEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-histogram-parameteriv-ext
                              "glGetHistogramParameterivEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-integerv "glGetIntegerv" :source)
    ((pname glenum) (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-lightfv "glGetLightfv" :source)
    ((light glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-lightiv "glGetLightiv" :source)
    ((light glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-mapdv "glGetMapdv" :source)
    ((target glenum)
     (query glenum)
     (v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-mapfv "glGetMapfv" :source)
    ((target glenum)
     (query glenum)
     (v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-mapiv "glGetMapiv" :source)
    ((target glenum)
     (query glenum)
     (v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-materialfv "glGetMaterialfv" :source)
    ((face glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-materialiv "glGetMaterialiv" :source)
    ((face glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-minmax-ext "glGetMinmaxEXT" :source)
    ((target glenum)
     (reset glboolean)
     (format glenum)
     (type glenum)
     (values gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-minmax-parameterfv-ext
                              "glGetMinmaxParameterfvEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-minmax-parameteriv-ext
                              "glGetMinmaxParameterivEXT"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-pixel-mapfv "glGetPixelMapfv" :source)
    ((map glenum) (values (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-pixel-mapuiv "glGetPixelMapuiv" :source)
    ((map glenum) (values (gl-vector :unsigned-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-pixel-mapusv "glGetPixelMapusv" :source)
    ((map glenum) (values (gl-vector :unsigned-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-polygon-stipple
                              "glGetPolygonStipple"
                              :source)
    ((mask (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-separable-filter-ext
                              "glGetSeparableFilterEXT"
                              :source)
    ((target glenum)
     (format glenum)
     (type glenum)
     (row gl-vector)
     (column gl-vector)
     (span gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-sharpen-tex-func-sgis
                              "glGetSharpenTexFuncSGIS"
                              :source)
    ((target glenum) (points (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-string "glGetString" :source)
    ((name glenum))
  :result-type #+Win32 (w:lpstr :pass-by :reference)
               #-Win32 (:reference :lisp-string-array)
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-envfv "glGetTexEnvfv" :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-enviv "glGetTexEnviv" :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-gendv "glGetTexGendv" :source)
    ((coord glenum)
     (pname glenum)
     (params (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-genfv "glGetTexGenfv" :source)
    ((coord glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-geniv "glGetTexGeniv" :source)
    ((coord glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-image "glGetTexImage" :source)
    ((target glenum)
     (level glint)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-level-parameterfv
                              "glGetTexLevelParameterfv"
                              :source)
    ((target glenum)
     (level glint)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-level-parameteriv
                              "glGetTexLevelParameteriv"
                              :source)
    ((target glenum)
     (level glint)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-parameterfv
                              "glGetTexParameterfv"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-get-tex-parameteriv
                              "glGetTexParameteriv"
                              :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-hint "glHint" :source)
    ((target glenum) (mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-histogram-ext "glHistogramEXT" :source)
    ((target glenum)
     (width glsizei)
     (internalformat glenum)
     (sink glboolean))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-index-mask "glIndexMask" :source)
    ((mask gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexd "glIndexd" :source)
    ((c gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexdv "glIndexdv" :source)
    ((c (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexf "glIndexf" :source)
    ((c glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexfv "glIndexfv" :source)
    ((c (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexi "glIndexi" :source)
    ((c glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexiv "glIndexiv" :source)
    ((c (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexs "glIndexs" :source)
    ((c glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-indexsv "glIndexsv" :source)
    ((c (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-init-names "glInitNames" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-is-enabled "glIsEnabled" :source)
    ((cap glenum))
  :result-type glboolean
  :language :ansi-c)

(fli:define-foreign-function (gl-is-list "glIsList" :source)
    ((list gluint))
  :result-type glboolean
  :language :ansi-c)

(fli:define-foreign-function (gl-light-modelf "glLightModelf" :source)
    ((pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-light-modelfv "glLightModelfv" :source)
    ((pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-light-modeli "glLightModeli" :source)
    ((pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-light-modeliv "glLightModeliv" :source)
    ((pname glenum) (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-lightf "glLightf" :source)
    ((light glenum) (pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-lightfv "glLightfv" :source)
    ((light glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-lighti "glLighti" :source)
    ((light glenum) (pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-lightiv "glLightiv" :source)
    ((light glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-line-stipple "glLineStipple" :source)
    ((factor glint) (pattern glushort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-line-width "glLineWidth" :source)
    ((width glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-list-base "glListBase" :source)
    ((base gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-load-identity "glLoadIdentity" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-load-matrixd "glLoadMatrixd" :source)
    ((m (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-load-matrixf "glLoadMatrixf" :source)
    ((m (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-load-name "glLoadName" :source)
    ((name gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-logic-op "glLogicOp" :source)
    ((opcode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map1-d "glMap1d" :source)
    ((target glenum)
     (u1 gldouble)
     (u2 gldouble)
     (stride glint)
     (order glint)
     (points (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map1-f "glMap1f" :source)
    ((target glenum)
     (u1 glfloat)
     (u2 glfloat)
     (stride glint)
     (order glint)
     (points (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map2-d "glMap2d" :source)
    ((target glenum)
     (u1 gldouble)
     (u2 gldouble)
     (ustride glint)
     (uorder glint)
     (v1 gldouble)
     (v2 gldouble)
     (vstride glint)
     (vorder glint)
     (points (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map2-f "glMap2f" :source)
    ((target glenum)
     (u1 glfloat)
     (u2 glfloat)
     (ustride glint)
     (uorder glint)
     (v1 glfloat)
     (v2 glfloat)
     (vstride glint)
     (vorder glint)
     (points (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map-grid1-d "glMapGrid1d" :source)
    ((un glint) (u1 gldouble) (u2 gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map-grid1-f "glMapGrid1f" :source)
    ((un glint) (u1 glfloat) (u2 glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map-grid2-d "glMapGrid2d" :source)
    ((un glint)
     (u1 gldouble)
     (u2 gldouble)
     (vn glint)
     (v1 gldouble)
     (v2 gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-map-grid2-f "glMapGrid2f" :source)
    ((un glint)
     (u1 glfloat)
     (u2 glfloat)
     (vn glint)
     (v1 glfloat)
     (v2 glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-materialf "glMaterialf" :source)
    ((face glenum) (pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-materialfv "glMaterialfv" :source)
    ((face glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-materiali "glMateriali" :source)
    ((face glenum) (pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-materialiv "glMaterialiv" :source)
    ((face glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-matrix-mode "glMatrixMode" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-minmax-ext "glMinmaxEXT" :source)
    ((target glenum)
     (internalformat glenum)
     (sink glboolean))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-mult-matrixd "glMultMatrixd" :source)
    ((m (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-mult-matrixf "glMultMatrixf" :source)
    ((m (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-new-list "glNewList" :source)
    ((list gluint) (mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-b "glNormal3b" :source)
    ((nx glbyte) (ny glbyte) (nz glbyte))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-bv "glNormal3bv" :source)
    ((v (gl-vector :signed-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-d "glNormal3d" :source)
    ((nx gldouble) (ny gldouble) (nz gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-dv "glNormal3dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-f "glNormal3f" :source)
    ((nx glfloat) (ny glfloat) (nz glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-fv "glNormal3fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-i "glNormal3i" :source)
    ((nx glint) (ny glint) (nz glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-iv "glNormal3iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-s "glNormal3s" :source)
    ((nx glshort) (ny glshort) (nz glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-normal3-sv "glNormal3sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-ortho "glOrtho" :source)
    ((left gldouble)
     (right gldouble)
     (bottom gldouble)
     (top gldouble)
     (near gldouble)
     (far gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pass-through "glPassThrough" :source)
    ((token glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-mapfv "glPixelMapfv" :source)
    ((map glenum)
     (mapsize glint)
     (values (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-mapuiv "glPixelMapuiv" :source)
    ((map glenum)
     (mapsize glint)
     (values (gl-vector :unsigned-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-mapusv "glPixelMapusv" :source)
    ((map glenum)
     (mapsize glint)
     (values (gl-vector :unsigned-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-storef "glPixelStoref" :source)
    ((pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-storei "glPixelStorei" :source)
    ((pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-transferf "glPixelTransferf" :source)
    ((pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-transferi "glPixelTransferi" :source)
    ((pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pixel-zoom "glPixelZoom" :source)
    ((xfactor glfloat) (yfactor glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-point-size "glPointSize" :source)
    ((size glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-polygon-mode "glPolygonMode" :source)
    ((face glenum) (mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-polygon-offset-ext "glPolygonOffsetEXT" :source)
    ((factor glfloat) (bias glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-polygon-stipple "glPolygonStipple" :source)
    ((mask (gl-vector :unsigned-8)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pop-attrib "glPopAttrib" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pop-matrix "glPopMatrix" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-pop-name "glPopName" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-push-attrib "glPushAttrib" :source)
    ((mask glbitfield))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-push-matrix "glPushMatrix" :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-push-name "glPushName" :source)
    ((name gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-d "glRasterPos2d" :source)
    ((x gldouble) (y gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-dv "glRasterPos2dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-f "glRasterPos2f" :source)
    ((x glfloat) (y glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-fv "glRasterPos2fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-i "glRasterPos2i" :source)
    ((x glint) (y glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-iv "glRasterPos2iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-s "glRasterPos2s" :source)
    ((x glshort) (y glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos2-sv "glRasterPos2sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-d "glRasterPos3d" :source)
    ((x gldouble) (y gldouble) (z gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-dv "glRasterPos3dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-f "glRasterPos3f" :source)
    ((x glfloat) (y glfloat) (z glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-fv "glRasterPos3fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-i "glRasterPos3i" :source)
    ((x glint) (y glint) (z glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-iv "glRasterPos3iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-s "glRasterPos3s" :source)
    ((x glshort) (y glshort) (z glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos3-sv "glRasterPos3sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-d "glRasterPos4d" :source)
    ((x gldouble)
     (y gldouble)
     (z gldouble)
     (w gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-dv "glRasterPos4dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-f "glRasterPos4f" :source)
    ((x glfloat) (y glfloat) (z glfloat) (w glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-fv "glRasterPos4fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-i "glRasterPos4i" :source)
    ((x glint) (y glint) (z glint) (w glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-iv "glRasterPos4iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-s "glRasterPos4s" :source)
    ((x glshort) (y glshort) (z glshort) (w glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-raster-pos4-sv "glRasterPos4sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-read-buffer "glReadBuffer" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-read-pixels "glReadPixels" :source)
    ((x glint)
     (y glint)
     (width glsizei)
     (height glsizei)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rectd "glRectd" :source)
    ((x1 gldouble)
     (y1 gldouble)
     (x2 gldouble)
     (y2 gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rectdv "glRectdv" :source)
    ((v1 (gl-vector :double-float))
     (v2 (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rectf "glRectf" :source)
    ((x1 glfloat)
     (y1 glfloat)
     (x2 glfloat)
     (y2 glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rectfv "glRectfv" :source)
    ((v1 (gl-vector :single-float))
     (v2 (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-recti "glRecti" :source)
    ((x1 glint) (y1 glint) (x2 glint) (y2 glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rectiv "glRectiv" :source)
    ((v1 (gl-vector :signed-32))
     (v2 (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rects "glRects" :source)
    ((x1 glshort)
     (y1 glshort)
     (x2 glshort)
     (y2 glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rectsv "glRectsv" :source)
    ((v1 (gl-vector :signed-16))
     (v2 (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-render-mode "glRenderMode" :source)
    ((mode glenum))
  :result-type glint
  :language :ansi-c)

(fli:define-foreign-function (gl-reset-histogram-ext
                              "glResetHistogramEXT"
                              :source)
    ((target glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-reset-minmax-ext "glResetMinmaxEXT" :source)
    ((target glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rotated "glRotated" :source)
    ((angle gldouble)
     (x gldouble)
     (y gldouble)
     (z gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-rotatef "glRotatef" :source)
    ((angle glfloat)
     (x glfloat)
     (y glfloat)
     (z glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-sample-mask-sgis "glSampleMaskSGIS" :source)
    ((value glfloat) (invert glboolean))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-sample-pattern-sgis
                              "glSamplePatternSGIS"
                              :source)
    ((pattern glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-scaled "glScaled" :source)
    ((x gldouble) (y gldouble) (z gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-scalef "glScalef" :source)
    ((x glfloat) (y glfloat) (z glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-scissor "glScissor" :source)
    ((x glint)
     (y glint)
     (width glsizei)
     (height glsizei))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-select-buffer "glSelectBuffer" :source)
    ((size glsizei) (buffer (gl-vector :unsigned-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-separable-filter2-dext
                              "glSeparableFilter2DEXT"
                              :source)
    ((target glenum)
     (internalformat glenum)
     (width glsizei)
     (height glsizei)
     (format glenum)
     (type glenum)
     (row gl-vector)
     (column gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-shade-model "glShadeModel" :source)
    ((mode glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-sharpen-tex-func-sgis
                              "glSharpenTexFuncSGIS"
                              :source)
    ((target glenum)
     (n glsizei)
     (points (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-stencil-func "glStencilFunc" :source)
    ((func glenum) (ref glint) (mask gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-stencil-mask "glStencilMask" :source)
    ((mask gluint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-stencil-op "glStencilOp" :source)
    ((fail glenum) (zfail glenum) (zpass glenum))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tag-sample-buffer-sgix
                              "glTagSampleBufferSGIX"
                              :source)
    nil
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-d "glTexCoord1d" :source)
    ((s gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-dv "glTexCoord1dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-f "glTexCoord1f" :source)
    ((s glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-fv "glTexCoord1fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-i "glTexCoord1i" :source)
    ((s glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-iv "glTexCoord1iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-s "glTexCoord1s" :source)
    ((s glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord1-sv "glTexCoord1sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-d "glTexCoord2d" :source)
    ((s gldouble) (arg-t gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-dv "glTexCoord2dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-f "glTexCoord2f" :source)
    ((s glfloat) (arg-t glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-fv "glTexCoord2fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-i "glTexCoord2i" :source)
    ((s glint) (arg-t glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-iv "glTexCoord2iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-s "glTexCoord2s" :source)
    ((s glshort) (arg-t glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord2-sv "glTexCoord2sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-d "glTexCoord3d" :source)
    ((s gldouble) (arg-t gldouble) (r gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-dv "glTexCoord3dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-f "glTexCoord3f" :source)
    ((s glfloat) (arg-t glfloat) (r glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-fv "glTexCoord3fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-i "glTexCoord3i" :source)
    ((s glint) (arg-t glint) (r glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-iv "glTexCoord3iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-s "glTexCoord3s" :source)
    ((s glshort) (arg-t glshort) (r glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord3-sv "glTexCoord3sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-d "glTexCoord4d" :source)
    ((s gldouble)
     (arg-t gldouble)
     (r gldouble)
     (q gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-dv "glTexCoord4dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-f "glTexCoord4f" :source)
    ((s glfloat)
     (arg-t glfloat)
     (r glfloat)
     (q glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-fv "glTexCoord4fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-i "glTexCoord4i" :source)
    ((s glint) (arg-t glint) (r glint) (q glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-iv "glTexCoord4iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-s "glTexCoord4s" :source)
    ((s glshort)
     (arg-t glshort)
     (r glshort)
     (q glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-coord4-sv "glTexCoord4sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-envf "glTexEnvf" :source)
    ((target glenum) (pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-envfv "glTexEnvfv" :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-envi "glTexEnvi" :source)
    ((target glenum) (pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-enviv "glTexEnviv" :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-gend "glTexGend" :source)
    ((coord glenum) (pname glenum) (param gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-gendv "glTexGendv" :source)
    ((coord glenum)
     (pname glenum)
     (params (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-genf "glTexGenf" :source)
    ((coord glenum) (pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-genfv "glTexGenfv" :source)
    ((coord glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-geni "glTexGeni" :source)
    ((coord glenum) (pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-geniv "glTexGeniv" :source)
    ((coord glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-image1-d "glTexImage1D" :source)
    ((target glenum)
     (level glint)
     (components glint)
     (width glsizei)
     (border glint)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-image2-d "glTexImage2D" :source)
    ((target glenum)
     (level glint)
     (components glint)
     (width glsizei)
     (height glsizei)
     (border glint)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-image3-dext "glTexImage3DEXT" :source)
    ((target glenum)
     (level glint)
     (internalformat glenum)
     (width glsizei)
     (height glsizei)
     (depth glsizei)
     (border glint)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-parameterf "glTexParameterf" :source)
    ((target glenum) (pname glenum) (param glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-parameterfv "glTexParameterfv" :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-parameteri "glTexParameteri" :source)
    ((target glenum) (pname glenum) (param glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-parameteriv "glTexParameteriv" :source)
    ((target glenum)
     (pname glenum)
     (params (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-sub-image1-dext
                              "glTexSubImage1DEXT"
                              :source)
    ((target glenum)
     (level glint)
     (xoffset glint)
     (width glsizei)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-sub-image2-dext
                              "glTexSubImage2DEXT"
                              :source)
    ((target glenum)
     (level glint)
     (xoffset glint)
     (yoffset glint)
     (width glsizei)
     (height glsizei)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-tex-sub-image3-dext
                              "glTexSubImage3DEXT"
                              :source)
    ((target glenum)
     (level glint)
     (xoffset glsizei)
     (yoffset glsizei)
     (zoffset glsizei)
     (width glsizei)
     (height glsizei)
     (depth glsizei)
     (format glenum)
     (type glenum)
     (pixels gl-vector))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-translated "glTranslated" :source)
    ((x gldouble) (y gldouble) (z gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-translatef "glTranslatef" :source)
    ((x glfloat) (y glfloat) (z glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-d "glVertex2d" :source)
    ((x gldouble) (y gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-dv "glVertex2dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-f "glVertex2f" :source)
    ((x glfloat) (y glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-fv "glVertex2fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-i "glVertex2i" :source)
    ((x glint) (y glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-iv "glVertex2iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-s "glVertex2s" :source)
    ((x glshort) (y glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex2-sv "glVertex2sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-d "glVertex3d" :source)
    ((x gldouble) (y gldouble) (z gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-dv "glVertex3dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-f "glVertex3f" :source)
    ((x glfloat) (y glfloat) (z glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-fv "glVertex3fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-i "glVertex3i" :source)
    ((x glint) (y glint) (z glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-iv "glVertex3iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-s "glVertex3s" :source)
    ((x glshort) (y glshort) (z glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex3-sv "glVertex3sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-d "glVertex4d" :source)
    ((x gldouble)
     (y gldouble)
     (z gldouble)
     (w gldouble))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-dv "glVertex4dv" :source)
    ((v (gl-vector :double-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-f "glVertex4f" :source)
    ((x glfloat) (y glfloat) (z glfloat) (w glfloat))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-fv "glVertex4fv" :source)
    ((v (gl-vector :single-float)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-i "glVertex4i" :source)
    ((x glint) (y glint) (z glint) (w glint))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-iv "glVertex4iv" :source)
    ((v (gl-vector :signed-32)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-s "glVertex4s" :source)
    ((x glshort) (y glshort) (z glshort) (w glshort))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-vertex4-sv "glVertex4sv" :source)
    ((v (gl-vector :signed-16)))
  :result-type :void
  :language :ansi-c)

(fli:define-foreign-function (gl-viewport "glViewport" :source)
    ((x glint)
     (y glint)
     (width glsizei)
     (height glsizei))
  :result-type :void
  :language :ansi-c)

