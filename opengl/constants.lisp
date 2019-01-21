;; -*- Mode: Lisp; rcs-header: "$Header: /hope/cam1/hope.4/compound/61/LISPopengl/RCS/constants.lisp,v 1.3.3.2 2003/06/16 10:45:18 martin Exp $" -*-

;; Copyright (c) 1987--2003 Xanalys LLC. All rights reserved.


(in-package "OPENGL")



(defconstant *GL-ACCUM*                            #x0100)
(defconstant *GL-LOAD*                             #x0101)
(defconstant *GL-RETURN*                           #x0102)
(defconstant *GL-MULT*                             #x0103)
(defconstant *GL-ADD*                              #x0104)

;; AlphaFunction 
(defconstant *GL-NEVER*                            #x0200)
(defconstant *GL-LESS*                             #x0201)
(defconstant *GL-EQUAL*                            #x0202)
(defconstant *GL-LEQUAL*                           #x0203)
(defconstant *GL-GREATER*                          #x0204)
(defconstant *GL-NOTEQUAL*                         #x0205)
(defconstant *GL-GEQUAL*                           #x0206)
(defconstant *GL-ALWAYS*                           #x0207)

;; AttribMask
(defconstant *GL-CURRENT-BIT*                      #x00000001)
(defconstant *GL-POINT-BIT*                        #x00000002)
(defconstant *GL-LINE-BIT*                         #x00000004)
(defconstant *GL-POLYGON-BIT*                      #x00000008)
(defconstant *GL-POLYGON-STIPPLE-BIT*              #x00000010)
(defconstant *GL-PIXEL-MODE-BIT*                   #x00000020)
(defconstant *GL-LIGHTING-BIT*                     #x00000040)
(defconstant *GL-FOG-BIT*                          #x00000080)
(defconstant *GL-DEPTH-BUFFER-BIT*                 #x00000100)
(defconstant *GL-ACCUM-BUFFER-BIT*                 #x00000200)
(defconstant *GL-STENCIL-BUFFER-BIT*               #x00000400)
(defconstant *GL-VIEWPORT-BIT*                     #x00000800)
(defconstant *GL-TRANSFORM-BIT*                    #x00001000)
(defconstant *GL-ENABLE-BIT*                       #x00002000)
(defconstant *GL-COLOR-BUFFER-BIT*                 #x00004000)
(defconstant *GL-HINT-BIT*                         #x00008000)
(defconstant *GL-EVAL-BIT*                         #x00010000)
(defconstant *GL-LIST-BIT*                         #x00020000)
(defconstant *GL-TEXTURE-BIT*                      #x00040000)
(defconstant *GL-SCISSOR-BIT*                      #x00080000)
(defconstant *GL-ALL-ATTRIB-BITS*                  #x000fffff)

;; BeginMode
(defconstant *GL-POINTS*                           #x0000)
(defconstant *GL-LINES*                            #x0001)
(defconstant *GL-LINE-LOOP*                        #x0002)
(defconstant *GL-LINE-STRIP*                       #x0003)
(defconstant *GL-TRIANGLES*                        #x0004)
(defconstant *GL-TRIANGLE-STRIP*                   #x0005)
(defconstant *GL-TRIANGLE-FAN*                     #x0006)
(defconstant *GL-QUADS*                            #x0007)
(defconstant *GL-QUAD-STRIP*                       #x0008)
(defconstant *GL-POLYGON*                          #x0009)

;; BlendingFactorDest 
(defconstant *GL-ZERO*                             #x0)
(defconstant *GL-ONE*                              #x1)
(defconstant *GL-SRC-COLOR*                        #x0300)
(defconstant *GL-ONE-MINUS-SRC-COLOR*              #x0301)
(defconstant *GL-SRC-ALPHA*                        #x0302)
(defconstant *GL-ONE-MINUS-SRC-ALPHA*              #x0303)
(defconstant *GL-DST-ALPHA*                        #x0304)
(defconstant *GL-ONE-MINUS-DST-ALPHA*              #x0305)

;; BlendingFactorSrc
;;      GL-ZERO
;;      GL-ONE 
(defconstant *GL-DST-COLOR*                        #x0306)
(defconstant *GL-ONE-MINUS-DST-COLOR*              #x0307)
(defconstant *GL-SRC-ALPHA-SATURATE*               #x0308)
;;      GL-SRC-ALPHA 
;;      GL-ONE-MINUS-SRC-ALPHA 
;;      GL-DST-ALPHA 
;;      GL-ONE-MINUS-DST-ALPHA 

;; Boolean 
(defconstant *GL-TRUE*                             #x1)
(defconstant *GL-FALSE*                            #x0)

;; ClearBufferMask 
;;      GL-COLOR-BUFFER-BIT 
;;      GL-ACCUM-BUFFER-BIT 
;;      GL-STENCIL-BUFFER-BIT 
;;      GL-DEPTH-BUFFER-BIT 

;; ClipPlaneName 
(defconstant *GL-CLIP-PLANE0*                      #x3000)
(defconstant *GL-CLIP-PLANE1*                      #x3001)
(defconstant *GL-CLIP-PLANE2*                      #x3002)
(defconstant *GL-CLIP-PLANE3*                      #x3003)
(defconstant *GL-CLIP-PLANE4*                      #x3004)
(defconstant *GL-CLIP-PLANE5*                      #x3005)

;; ColorMaterialFace 
;;      GL-FRONT 
;;      GL-BACK 
;;      GL-FRONT-AND-BACK 

;; ColorMaterialParameter 
;;      GL-AMBIENT 
;;      GL-DIFFUSE 
;;      GL-SPECULAR 
;;      GL-EMISSION 
;;      GL-AMBIENT-AND-DIFFUSE 

;; CullFaceMode 
;;      GL-FRONT 
;;      GL-BACK 
;;      GL-FRONT-AND-BACK 

;; DepthFunction 
;;      GL-NEVER 
;;      GL-LESS 
;;      GL-EQUAL 
;;      GL-LEQUAL 
;;      GL-GREATER 
;;      GL-NOTEQUAL 
;;      GL-GEQUAL 
;;      GL-ALWAYS 

;; DrawBufferMode 
(defconstant *GL-NONE*                             #x0)
(defconstant *GL-FRONT-LEFT*                       #x0400)
(defconstant *GL-FRONT-RIGHT*                      #x0401)
(defconstant *GL-BACK-LEFT*                        #x0402)
(defconstant *GL-BACK-RIGHT*                       #x0403)
(defconstant *GL-FRONT*                            #x0404)
(defconstant *GL-BACK*                             #x0405)
(defconstant *GL-LEFT*                             #x0406)
(defconstant *GL-RIGHT*                            #x0407)
(defconstant *GL-FRONT-AND-BACK*                   #x0408)
(defconstant *GL-AUX0*                             #x0409)
(defconstant *GL-AUX1*                             #x040A)
(defconstant *GL-AUX2*                             #x040B)
(defconstant *GL-AUX3*                             #x040C)

;; Enable 
;;      GL-FOG 
;;      GL-LIGHTING 
;;      GL-TEXTURE-1D 
;;      GL-TEXTURE-2D 
;;      GL-LINE-STIPPLE 
;;      GL-POLYGON-STIPPLE 
;;      GL-CULL-FACE 
;;      GL-ALPHA-TEST 
;;      GL-BLEND 
;;      GL-LOGIC-OP 
;;      GL-DITHER 
;;      GL-STENCIL-TEST 
;;      GL-DEPTH-TEST 
;;      GL-CLIP-PLANE0 
;;      GL-CLIP-PLANE1 
;;      GL-CLIP-PLANE2 
;;      GL-CLIP-PLANE3 
;;      GL-CLIP-PLANE4 
;;      GL-CLIP-PLANE5 
;;      GL-LIGHT0 
;;      GL-LIGHT1 
;;      GL-LIGHT2 
;;      GL-LIGHT3 
;;      GL-LIGHT4 
;;      GL-LIGHT5 
;;      GL-LIGHT6 
;;      GL-LIGHT7 
;;      GL-TEXTURE-GEN-S 
;;      GL-TEXTURE-GEN-T 
;;      GL-TEXTURE-GEN-R 
;;      GL-TEXTURE-GEN-Q 
;;      GL-MAP1-VERTEX-3 
;;      GL-MAP1-VERTEX-4 
;;      GL-MAP1-COLOR-4 
;;      GL-MAP1-INDEX 
;;      GL-MAP1-NORMAL 
;;      GL-MAP1-TEXTURE-COORD-1 
;;      GL-MAP1-TEXTURE-COORD-2 
;;      GL-MAP1-TEXTURE-COORD-3 
;;      GL-MAP1-TEXTURE-COORD-4 
;;      GL-MAP2-VERTEX-3 
;;      GL-MAP2-VERTEX-4 
;;      GL-MAP2-COLOR-4 
;;      GL-MAP2-INDEX 
;;      GL-MAP2-NORMAL 
;;      GL-MAP2-TEXTURE-COORD-1 
;;      GL-MAP2-TEXTURE-COORD-2 
;;      GL-MAP2-TEXTURE-COORD-3 
;;      GL-MAP2-TEXTURE-COORD-4 
;;      GL-POINT-SMOOTH 
;;      GL-LINE-SMOOTH 
;;      GL-POLYGON-SMOOTH 
;;      GL-SCISSOR-TEST 
;;      GL-COLOR-MATERIAL 
;;      GL-NORMALIZE 
;;      GL-AUTO-NORMAL 

;; ErrorCode 
(defconstant *GL-NO-ERROR*                         #x0)
(defconstant *GL-INVALID-ENUM*                     #x0500)
(defconstant *GL-INVALID-VALUE*                    #x0501)
(defconstant *GL-INVALID-OPERATION*                #x0502)
(defconstant *GL-STACK-OVERFLOW*                   #x0503)
(defconstant *GL-STACK-UNDERFLOW*                  #x0504)
(defconstant *GL-OUT-OF-MEMORY*                    #x0505)

;; FeedBackMode 
(defconstant *GL-2D*                               #x0600)
(defconstant *GL-3D*                               #x0601)
(defconstant *GL-3D-COLOR*                         #x0602)
(defconstant *GL-3D-COLOR-TEXTURE*                 #x0603)
(defconstant *GL-4D-COLOR-TEXTURE*                 #x0604)

;; FeedBackToken 
(defconstant *GL-PASS-THROUGH-TOKEN*               #x0700)
(defconstant *GL-POINT-TOKEN*                      #x0701)
(defconstant *GL-LINE-TOKEN*                       #x0702)
(defconstant *GL-POLYGON-TOKEN*                    #x0703)
(defconstant *GL-BITMAP-TOKEN*                     #x0704)
(defconstant *GL-DRAW-PIXEL-TOKEN*                 #x0705)
(defconstant *GL-COPY-PIXEL-TOKEN*                 #x0706)
(defconstant *GL-LINE-RESET-TOKEN*                 #x0707)

;; FogMode 
;;      GL-LINEAR 
(defconstant *GL-EXP*                              #x0800)
(defconstant *GL-EXP2*                             #x0801)

;; FogParameter 
;;      GL-FOG-COLOR 
;;      GL-FOG-DENSITY 
;;      GL-FOG-END 
;;      GL-FOG-INDEX 
;;      GL-FOG-MODE 
;;      GL-FOG-START 

;; FrontFaceDirection 
(defconstant *GL-CW*                               #x0900)
(defconstant *GL-CCW*                              #x0901)

;; GetMapTarget 
(defconstant *GL-COEFF*                            #x0A00)
(defconstant *GL-ORDER*                            #x0A01)
(defconstant *GL-DOMAIN*                           #x0A02)

;; GetPixelMap 
;;      GL-PIXEL-MAP-I-TO-I 
;;      GL-PIXEL-MAP-S-TO-S 
;;      GL-PIXEL-MAP-I-TO-R 
;;      GL-PIXEL-MAP-I-TO-G 
;;      GL-PIXEL-MAP-I-TO-B 
;;      GL-PIXEL-MAP-I-TO-A 
;;      GL-PIXEL-MAP-R-TO-R 
;;      GL-PIXEL-MAP-G-TO-G 
;;      GL-PIXEL-MAP-B-TO-B 
;;      GL-PIXEL-MAP-A-TO-A 

;; GetTarget 
(defconstant *GL-CURRENT-COLOR*                    #x0B00)
(defconstant *GL-CURRENT-INDEX*                    #x0B01)
(defconstant *GL-CURRENT-NORMAL*                   #x0B02)
(defconstant *GL-CURRENT-TEXTURE-COORDS*           #x0B03)
(defconstant *GL-CURRENT-RASTER-COLOR*             #x0B04)
(defconstant *GL-CURRENT-RASTER-INDEX*             #x0B05)
(defconstant *GL-CURRENT-RASTER-TEXTURE-COORDS*    #x0B06)
(defconstant *GL-CURRENT-RASTER-POSITION*          #x0B07)
(defconstant *GL-CURRENT-RASTER-POSITION-VALID*    #x0B08)
(defconstant *GL-CURRENT-RASTER-DISTANCE*          #x0B09)
(defconstant *GL-POINT-SMOOTH*                     #x0B10)
(defconstant *GL-POINT-SIZE*                       #x0B11)
(defconstant *GL-POINT-SIZE-RANGE*                 #x0B12)
(defconstant *GL-POINT-SIZE-GRANULARITY*           #x0B13)
(defconstant *GL-LINE-SMOOTH*                      #x0B20)
(defconstant *GL-LINE-WIDTH*                       #x0B21)
(defconstant *GL-LINE-WIDTH-RANGE*                 #x0B22)
(defconstant *GL-LINE-WIDTH-GRANULARITY*           #x0B23)
(defconstant *GL-LINE-STIPPLE*                     #x0B24)
(defconstant *GL-LINE-STIPPLE-PATTERN*             #x0B25)
(defconstant *GL-LINE-STIPPLE-REPEAT*              #x0B26)
(defconstant *GL-LIST-MODE*                        #x0B30)
(defconstant *GL-MAX-LIST-NESTING*                 #x0B31)
(defconstant *GL-LIST-BASE*                        #x0B32)
(defconstant *GL-LIST-INDEX*                       #x0B33)
(defconstant *GL-POLYGON-MODE*                     #x0B40)
(defconstant *GL-POLYGON-SMOOTH*                   #x0B41)
(defconstant *GL-POLYGON-STIPPLE*                  #x0B42)
(defconstant *GL-EDGE-FLAG*                        #x0B43)
(defconstant *GL-CULL-FACE*                        #x0B44)
(defconstant *GL-CULL-FACE-MODE*                   #x0B45)
(defconstant *GL-FRONT-FACE*                       #x0B46)
(defconstant *GL-LIGHTING*                         #x0B50)
(defconstant *GL-LIGHT-MODEL-LOCAL-VIEWER*         #x0B51)
(defconstant *GL-LIGHT-MODEL-TWO-SIDE*             #x0B52)
(defconstant *GL-LIGHT-MODEL-AMBIENT*              #x0B53)
(defconstant *GL-SHADE-MODEL*                      #x0B54)
(defconstant *GL-COLOR-MATERIAL-FACE*              #x0B55)
(defconstant *GL-COLOR-MATERIAL-PARAMETER*         #x0B56)
(defconstant *GL-COLOR-MATERIAL*                   #x0B57)
(defconstant *GL-FOG*                              #x0B60)
(defconstant *GL-FOG-INDEX*                        #x0B61)
(defconstant *GL-FOG-DENSITY*                      #x0B62)
(defconstant *GL-FOG-START*                        #x0B63)
(defconstant *GL-FOG-END*                          #x0B64)
(defconstant *GL-FOG-MODE*                         #x0B65)
(defconstant *GL-FOG-COLOR*                        #x0B66)
(defconstant *GL-DEPTH-RANGE*                      #x0B70)
(defconstant *GL-DEPTH-TEST*                       #x0B71)
(defconstant *GL-DEPTH-WRITEMASK*                  #x0B72)
(defconstant *GL-DEPTH-CLEAR-VALUE*                #x0B73)
(defconstant *GL-DEPTH-FUNC*                       #x0B74)
(defconstant *GL-ACCUM-CLEAR-VALUE*                #x0B80)
(defconstant *GL-STENCIL-TEST*                     #x0B90)
(defconstant *GL-STENCIL-CLEAR-VALUE*              #x0B91)
(defconstant *GL-STENCIL-FUNC*                     #x0B92)
(defconstant *GL-STENCIL-VALUE-MASK*               #x0B93)
(defconstant *GL-STENCIL-FAIL*                     #x0B94)
(defconstant *GL-STENCIL-PASS-DEPTH-FAIL*          #x0B95)
(defconstant *GL-STENCIL-PASS-DEPTH-PASS*          #x0B96)
(defconstant *GL-STENCIL-REF*                      #x0B97)
(defconstant *GL-STENCIL-WRITEMASK*                #x0B98)
(defconstant *GL-MATRIX-MODE*                      #x0BA0)
(defconstant *GL-NORMALIZE*                        #x0BA1)
(defconstant *GL-VIEWPORT*                         #x0BA2)
(defconstant *GL-MODELVIEW-STACK-DEPTH*            #x0BA3)
(defconstant *GL-PROJECTION-STACK-DEPTH*           #x0BA4)
(defconstant *GL-TEXTURE-STACK-DEPTH*              #x0BA5)
(defconstant *GL-MODELVIEW-MATRIX*                 #x0BA6)
(defconstant *GL-PROJECTION-MATRIX*                #x0BA7)
(defconstant *GL-TEXTURE-MATRIX*                   #x0BA8)
(defconstant *GL-ATTRIB-STACK-DEPTH*               #x0BB0)
(defconstant *GL-ALPHA-TEST*                       #x0BC0)
(defconstant *GL-ALPHA-TEST-FUNC*                  #x0BC1)
(defconstant *GL-ALPHA-TEST-REF*                   #x0BC2)
(defconstant *GL-DITHER*                           #x0BD0)
(defconstant *GL-BLEND-DST*                        #x0BE0)
(defconstant *GL-BLEND-SRC*                        #x0BE1)
(defconstant *GL-BLEND*                            #x0BE2)
(defconstant *GL-LOGIC-OP-MODE*                    #x0BF0)
(defconstant *GL-LOGIC-OP*                         #x0BF1)
(defconstant *GL-AUX-BUFFERS*                      #x0C00)
(defconstant *GL-DRAW-BUFFER*                      #x0C01)
(defconstant *GL-READ-BUFFER*                      #x0C02)
(defconstant *GL-SCISSOR-BOX*                      #x0C10)
(defconstant *GL-SCISSOR-TEST*                     #x0C11)
(defconstant *GL-INDEX-CLEAR-VALUE*                #x0C20)
(defconstant *GL-INDEX-WRITEMASK*                  #x0C21)
(defconstant *GL-COLOR-CLEAR-VALUE*                #x0C22)
(defconstant *GL-COLOR-WRITEMASK*                  #x0C23)
(defconstant *GL-INDEX-MODE*                       #x0C30)
(defconstant *GL-RGBA-MODE*                        #x0C31)
(defconstant *GL-DOUBLEBUFFER*                     #x0C32)
(defconstant *GL-STEREO*                           #x0C33)
(defconstant *GL-RENDER-MODE*                      #x0C40)
(defconstant *GL-PERSPECTIVE-CORRECTION-HINT*      #x0C50)
(defconstant *GL-POINT-SMOOTH-HINT*                #x0C51)
(defconstant *GL-LINE-SMOOTH-HINT*                 #x0C52)
(defconstant *GL-POLYGON-SMOOTH-HINT*              #x0C53)
(defconstant *GL-FOG-HINT*                         #x0C54)
(defconstant *GL-TEXTURE-GEN-S*                    #x0C60)
(defconstant *GL-TEXTURE-GEN-T*                    #x0C61)
(defconstant *GL-TEXTURE-GEN-R*                    #x0C62)
(defconstant *GL-TEXTURE-GEN-Q*                    #x0C63)
(defconstant *GL-PIXEL-MAP-I-TO-I*                 #x0C70)
(defconstant *GL-PIXEL-MAP-S-TO-S*                 #x0C71)
(defconstant *GL-PIXEL-MAP-I-TO-R*                 #x0C72)
(defconstant *GL-PIXEL-MAP-I-TO-G*                 #x0C73)
(defconstant *GL-PIXEL-MAP-I-TO-B*                 #x0C74)
(defconstant *GL-PIXEL-MAP-I-TO-A*                 #x0C75)
(defconstant *GL-PIXEL-MAP-R-TO-R*                 #x0C76)
(defconstant *GL-PIXEL-MAP-G-TO-G*                 #x0C77)
(defconstant *GL-PIXEL-MAP-B-TO-B*                 #x0C78)
(defconstant *GL-PIXEL-MAP-A-TO-A*                 #x0C79)
(defconstant *GL-PIXEL-MAP-I-TO-I-SIZE*            #x0CB0)
(defconstant *GL-PIXEL-MAP-S-TO-S-SIZE*            #x0CB1)
(defconstant *GL-PIXEL-MAP-I-TO-R-SIZE*            #x0CB2)
(defconstant *GL-PIXEL-MAP-I-TO-G-SIZE*            #x0CB3)
(defconstant *GL-PIXEL-MAP-I-TO-B-SIZE*            #x0CB4)
(defconstant *GL-PIXEL-MAP-I-TO-A-SIZE*            #x0CB5)
(defconstant *GL-PIXEL-MAP-R-TO-R-SIZE*            #x0CB6)
(defconstant *GL-PIXEL-MAP-G-TO-G-SIZE*            #x0CB7)
(defconstant *GL-PIXEL-MAP-B-TO-B-SIZE*            #x0CB8)
(defconstant *GL-PIXEL-MAP-A-TO-A-SIZE*            #x0CB9)
(defconstant *GL-UNPACK-SWAP-BYTES*                #x0CF0)
(defconstant *GL-UNPACK-LSB-FIRST*                 #x0CF1)
(defconstant *GL-UNPACK-ROW-LENGTH*                #x0CF2)
(defconstant *GL-UNPACK-SKIP-ROWS*                 #x0CF3)
(defconstant *GL-UNPACK-SKIP-PIXELS*               #x0CF4)
(defconstant *GL-UNPACK-ALIGNMENT*                 #x0CF5)
(defconstant *GL-PACK-SWAP-BYTES*                  #x0D00)
(defconstant *GL-PACK-LSB-FIRST*                   #x0D01)
(defconstant *GL-PACK-ROW-LENGTH*                  #x0D02)
(defconstant *GL-PACK-SKIP-ROWS*                   #x0D03)
(defconstant *GL-PACK-SKIP-PIXELS*                 #x0D04)
(defconstant *GL-PACK-ALIGNMENT*                   #x0D05)
(defconstant *GL-MAP-COLOR*                        #x0D10)
(defconstant *GL-MAP-STENCIL*                      #x0D11)
(defconstant *GL-INDEX-SHIFT*                      #x0D12)
(defconstant *GL-INDEX-OFFSET*                     #x0D13)
(defconstant *GL-RED-SCALE*                        #x0D14)
(defconstant *GL-RED-BIAS*                         #x0D15)
(defconstant *GL-ZOOM-X*                           #x0D16)
(defconstant *GL-ZOOM-Y*                           #x0D17)
(defconstant *GL-GREEN-SCALE*                      #x0D18)
(defconstant *GL-GREEN-BIAS*                       #x0D19)
(defconstant *GL-BLUE-SCALE*                       #x0D1A)
(defconstant *GL-BLUE-BIAS*                        #x0D1B)
(defconstant *GL-ALPHA-SCALE*                      #x0D1C)
(defconstant *GL-ALPHA-BIAS*                       #x0D1D)
(defconstant *GL-DEPTH-SCALE*                      #x0D1E)
(defconstant *GL-DEPTH-BIAS*                       #x0D1F)
(defconstant *GL-MAX-EVAL-ORDER*                   #x0D30)
(defconstant *GL-MAX-LIGHTS*                       #x0D31)
(defconstant *GL-MAX-CLIP-PLANES*                  #x0D32)
(defconstant *GL-MAX-TEXTURE-SIZE*                 #x0D33)
(defconstant *GL-MAX-PIXEL-MAP-TABLE*              #x0D34)
(defconstant *GL-MAX-ATTRIB-STACK-DEPTH*           #x0D35)
(defconstant *GL-MAX-MODELVIEW-STACK-DEPTH*        #x0D36)
(defconstant *GL-MAX-NAME-STACK-DEPTH*             #x0D37)
(defconstant *GL-MAX-PROJECTION-STACK-DEPTH*       #x0D38)
(defconstant *GL-MAX-TEXTURE-STACK-DEPTH*          #x0D39)
(defconstant *GL-MAX-VIEWPORT-DIMS*                #x0D3A)
(defconstant *GL-SUBPIXEL-BITS*                    #x0D50)
(defconstant *GL-INDEX-BITS*                       #x0D51)
(defconstant *GL-RED-BITS*                         #x0D52)
(defconstant *GL-GREEN-BITS*                       #x0D53)
(defconstant *GL-BLUE-BITS*                        #x0D54)
(defconstant *GL-ALPHA-BITS*                       #x0D55)
(defconstant *GL-DEPTH-BITS*                       #x0D56)
(defconstant *GL-STENCIL-BITS*                     #x0D57)
(defconstant *GL-ACCUM-RED-BITS*                   #x0D58)
(defconstant *GL-ACCUM-GREEN-BITS*                 #x0D59)
(defconstant *GL-ACCUM-BLUE-BITS*                  #x0D5A)
(defconstant *GL-ACCUM-ALPHA-BITS*                 #x0D5B)
(defconstant *GL-NAME-STACK-DEPTH*                 #x0D70)
(defconstant *GL-AUTO-NORMAL*                      #x0D80)
(defconstant *GL-MAP1-COLOR-4*                     #x0D90)
(defconstant *GL-MAP1-INDEX*                       #x0D91)
(defconstant *GL-MAP1-NORMAL*                      #x0D92)
(defconstant *GL-MAP1-TEXTURE-COORD-1*             #x0D93)
(defconstant *GL-MAP1-TEXTURE-COORD-2*             #x0D94)
(defconstant *GL-MAP1-TEXTURE-COORD-3*             #x0D95)
(defconstant *GL-MAP1-TEXTURE-COORD-4*             #x0D96)
(defconstant *GL-MAP1-VERTEX-3*                    #x0D97)
(defconstant *GL-MAP1-VERTEX-4*                    #x0D98)
(defconstant *GL-MAP2-COLOR-4*                     #x0DB0)
(defconstant *GL-MAP2-INDEX*                       #x0DB1)
(defconstant *GL-MAP2-NORMAL*                      #x0DB2)
(defconstant *GL-MAP2-TEXTURE-COORD-1*             #x0DB3)
(defconstant *GL-MAP2-TEXTURE-COORD-2*             #x0DB4)
(defconstant *GL-MAP2-TEXTURE-COORD-3*             #x0DB5)
(defconstant *GL-MAP2-TEXTURE-COORD-4*             #x0DB6)
(defconstant *GL-MAP2-VERTEX-3*                    #x0DB7)
(defconstant *GL-MAP2-VERTEX-4*                    #x0DB8)
(defconstant *GL-MAP1-GRID-DOMAIN*                 #x0DD0)
(defconstant *GL-MAP1-GRID-SEGMENTS*               #x0DD1)
(defconstant *GL-MAP2-GRID-DOMAIN*                 #x0DD2)
(defconstant *GL-MAP2-GRID-SEGMENTS*               #x0DD3)
(defconstant *GL-TEXTURE-1D*                       #x0DE0)
(defconstant *GL-TEXTURE-2D*                       #x0DE1)

;; GetTextureParameter 
;;      GL-TEXTURE-MAG-FILTER 
;;      GL-TEXTURE-MIN-FILTER 
;;      GL-TEXTURE-WRAP-S 
;;      GL-TEXTURE-WRAP-T 
(defconstant *GL-TEXTURE-WIDTH*                    #x1000)
(defconstant *GL-TEXTURE-HEIGHT*                   #x1001)
(defconstant *GL-TEXTURE-COMPONENTS*               #x1003)
(defconstant *GL-TEXTURE-BORDER-COLOR*             #x1004)
(defconstant *GL-TEXTURE-BORDER*                   #x1005)

;; HintMode 
(defconstant *GL-DONT-CARE*                        #x1100)
(defconstant *GL-FASTEST*                          #x1101)
(defconstant *GL-NICEST*                           #x1102)

;; HintTarget 
;;      GL-PERSPECTIVE-CORRECTION-HINT 
;;      GL-POINT-SMOOTH-HINT 
;;      GL-LINE-SMOOTH-HINT 
;;      GL-POLYGON-SMOOTH-HINT 
;;      GL-FOG-HINT 

;; LightModelParameter 
;;      GL-LIGHT-MODEL-AMBIENT 
;;      GL-LIGHT-MODEL-LOCAL-VIEWER 
;;      GL-LIGHT-MODEL-TWO-SIDE 

;; LightName 
(defconstant *GL-LIGHT0*                           #x4000)
(defconstant *GL-LIGHT1*                           #x4001)
(defconstant *GL-LIGHT2*                           #x4002)
(defconstant *GL-LIGHT3*                           #x4003)
(defconstant *GL-LIGHT4*                           #x4004)
(defconstant *GL-LIGHT5*                           #x4005)
(defconstant *GL-LIGHT6*                           #x4006)
(defconstant *GL-LIGHT7*                           #x4007)

;; LightParameter 
(defconstant *GL-AMBIENT*                          #x1200)
(defconstant *GL-DIFFUSE*                          #x1201)
(defconstant *GL-SPECULAR*                         #x1202)
(defconstant *GL-POSITION*                         #x1203)
(defconstant *GL-SPOT-DIRECTION*                   #x1204)
(defconstant *GL-SPOT-EXPONENT*                    #x1205)
(defconstant *GL-SPOT-CUTOFF*                      #x1206)
(defconstant *GL-CONSTANT-ATTENUATION*             #x1207)
(defconstant *GL-LINEAR-ATTENUATION*               #x1208)
(defconstant *GL-QUADRATIC-ATTENUATION*            #x1209)

;; ListMode 
(defconstant *GL-COMPILE*                          #x1300)
(defconstant *GL-COMPILE-AND-EXECUTE*              #x1301)

;; ListNameType 
(defconstant *GL-BYTE*                             #x1400)
(defconstant *GL-UNSIGNED-BYTE*                    #x1401)
(defconstant *GL-SHORT*                            #x1402)
(defconstant *GL-UNSIGNED-SHORT*                   #x1403)
(defconstant *GL-INT*                              #x1404)
(defconstant *GL-UNSIGNED-INT*                     #x1405)
(defconstant *GL-FLOAT*                            #x1406)
(defconstant *GL-2-BYTES*                          #x1407)
(defconstant *GL-3-BYTES*                          #x1408)
(defconstant *GL-4-BYTES*                          #x1409)

;; LogicOp 
(defconstant *GL-CLEAR*                            #x1500)
(defconstant *GL-AND*                              #x1501)
(defconstant *GL-AND-REVERSE*                      #x1502)
(defconstant *GL-COPY*                             #x1503)
(defconstant *GL-AND-INVERTED*                     #x1504)
(defconstant *GL-NOOP*                             #x1505)
(defconstant *GL-XOR*                              #x1506)
(defconstant *GL-OR*                               #x1507)
(defconstant *GL-NOR*                              #x1508)
(defconstant *GL-EQUIV*                            #x1509)
(defconstant *GL-INVERT*                           #x150A)
(defconstant *GL-OR-REVERSE*                       #x150B)
(defconstant *GL-COPY-INVERTED*                    #x150C)
(defconstant *GL-OR-INVERTED*                      #x150D)
(defconstant *GL-NAND*                             #x150E)
(defconstant *GL-SET*                              #x150F)

;; MapTarget 
;;      GL-MAP1-COLOR-4 
;;      GL-MAP1-INDEX 
;;      GL-MAP1-NORMAL 
;;      GL-MAP1-TEXTURE-COORD-1 
;;      GL-MAP1-TEXTURE-COORD-2 
;;      GL-MAP1-TEXTURE-COORD-3 
;;      GL-MAP1-TEXTURE-COORD-4 
;;      GL-MAP1-VERTEX-3 
;;      GL-MAP1-VERTEX-4 
;;      GL-MAP2-COLOR-4 
;;      GL-MAP2-INDEX 
;;      GL-MAP2-NORMAL 
;;      GL-MAP2-TEXTURE-COORD-1 
;;      GL-MAP2-TEXTURE-COORD-2 
;;      GL-MAP2-TEXTURE-COORD-3 
;;      GL-MAP2-TEXTURE-COORD-4 
;;      GL-MAP2-VERTEX-3 
;;      GL-MAP2-VERTEX-4 

;; MaterialFace 
;;      GL-FRONT 
;;      GL-BACK 
;;      GL-FRONT-AND-BACK 

;; MaterialParameter 
(defconstant *GL-EMISSION*                         #x1600)
(defconstant *GL-SHININESS*                        #x1601)
(defconstant *GL-AMBIENT-AND-DIFFUSE*              #x1602)
(defconstant *GL-COLOR-INDEXES*                    #x1603)
;;      GL-AMBIENT 
;;      GL-DIFFUSE 
;;      GL-SPECULAR 

;; MatrixMode 
(defconstant *GL-MODELVIEW*                        #x1700)
(defconstant *GL-PROJECTION*                       #x1701)
(defconstant *GL-TEXTURE*                          #x1702)

;; MeshMode1 
;;      GL-POINT 
;;      GL-LINE 

;; MeshMode2 
;;      GL-POINT 
;;      GL-LINE 
;;      GL-FILL 

;; PixelCopyType 
(defconstant *GL-COLOR*                            #x1800)
(defconstant *GL-DEPTH*                            #x1801)
(defconstant *GL-STENCIL*                          #x1802)

;; PixelFormat 
(defconstant *GL-COLOR-INDEX*                      #x1900)
(defconstant *GL-STENCIL-INDEX*                    #x1901)
(defconstant *GL-DEPTH-COMPONENT*                  #x1902)
(defconstant *GL-RED*                              #x1903)
(defconstant *GL-GREEN*                            #x1904)
(defconstant *GL-BLUE*                             #x1905)
(defconstant *GL-ALPHA*                            #x1906)
(defconstant *GL-RGB*                              #x1907)
(defconstant *GL-RGBA*                             #x1908)
(defconstant *GL-LUMINANCE*                        #x1909)
(defconstant *GL-LUMINANCE-ALPHA*                  #x190A)

;; PixelMap 
;;      GL-PIXEL-MAP-I-TO-I 
;;      GL-PIXEL-MAP-S-TO-S 
;;      GL-PIXEL-MAP-I-TO-R 
;;      GL-PIXEL-MAP-I-TO-G 
;;      GL-PIXEL-MAP-I-TO-B 
;;      GL-PIXEL-MAP-I-TO-A 
;;      GL-PIXEL-MAP-R-TO-R 
;;      GL-PIXEL-MAP-G-TO-G 
;;      GL-PIXEL-MAP-B-TO-B 
;;      GL-PIXEL-MAP-A-TO-A 

;; PixelStore 
;;      GL-UNPACK-SWAP-BYTES 
;;      GL-UNPACK-LSB-FIRST 
;;      GL-UNPACK-ROW-LENGTH 
;;      GL-UNPACK-SKIP-ROWS 
;;      GL-UNPACK-SKIP-PIXELS 
;;      GL-UNPACK-ALIGNMENT 
;;      GL-PACK-SWAP-BYTES 
;;      GL-PACK-LSB-FIRST 
;;      GL-PACK-ROW-LENGTH 
;;      GL-PACK-SKIP-ROWS 
;;      GL-PACK-SKIP-PIXELS 
;;      GL-PACK-ALIGNMENT 

;; PixelTransfer 
;;      GL-MAP-COLOR 
;;      GL-MAP-STENCIL 
;;      GL-INDEX-SHIFT 
;;      GL-INDEX-OFFSET 
;;      GL-RED-SCALE 
;;      GL-RED-BIAS 
;;      GL-GREEN-SCALE 
;;      GL-GREEN-BIAS 
;;      GL-BLUE-SCALE 
;;      GL-BLUE-BIAS 
;;      GL-ALPHA-SCALE 
;;      GL-ALPHA-BIAS 
;;      GL-DEPTH-SCALE 
;;      GL-DEPTH-BIAS 

;; PixelType 
(defconstant *GL-BITMAP*                           #x1A00)
;;      GL-BYTE 
;;      GL-UNSIGNED-BYTE 
;;      GL-SHORT 
;;      GL-UNSIGNED-SHORT 
;;      GL-INT 
;;      GL-UNSIGNED-INT 
;;      GL-FLOAT 

;; PolygonMode 
(defconstant *GL-POINT*                            #x1B00)
(defconstant *GL-LINE*                             #x1B01)
(defconstant *GL-FILL*                             #x1B02)

;; ReadBufferMode 
;;      GL-FRONT-LEFT 
;;      GL-FRONT-RIGHT 
;;      GL-BACK-LEFT 
;;      GL-BACK-RIGHT 
;;      GL-FRONT 
;;      GL-BACK 
;;      GL-LEFT 
;;      GL-RIGHT 
;;      GL-AUX0 
;;      GL-AUX1 
;;      GL-AUX2 
;;      GL-AUX3 

;; RenderingMode 
(defconstant *GL-RENDER*                           #x1C00)
(defconstant *GL-FEEDBACK*                         #x1C01)
(defconstant *GL-SELECT*                           #x1C02)

;; ShadingModel 
(defconstant *GL-FLAT*                             #x1D00)
(defconstant *GL-SMOOTH*                           #x1D01)

;; StencilFunction 
;;      GL-NEVER 
;;      GL-LESS 
;;      GL-EQUAL 
;;      GL-LEQUAL 
;;      GL-GREATER 
;;      GL-NOTEQUAL 
;;      GL-GEQUAL 
;;      GL-ALWAYS 

;; StencilOp 
;;      GL-ZERO 
(defconstant *GL-KEEP*                             #x1E00)
(defconstant *GL-REPLACE*                          #x1E01)
(defconstant *GL-INCR*                             #x1E02)
(defconstant *GL-DECR*                             #x1E03)
;;      GL-INVERT 

;; StringName 
(defconstant *GL-VENDOR*                           #x1F00)
(defconstant *GL-RENDERER*                         #x1F01)
(defconstant *GL-VERSION*                          #x1F02)
(defconstant *GL-EXTENSIONS*                       #x1F03)

;; TextureCoordName 
(defconstant *GL-S*                                #x2000)
(defconstant *GL-T*                                #x2001)
(defconstant *GL-R*                                #x2002)
(defconstant *GL-Q*                                #x2003)

;; TextureEnvMode 
(defconstant *GL-MODULATE*                         #x2100)
(defconstant *GL-DECAL*                            #x2101)
;;      GL-BLEND 

;; TextureEnvParameter 
(defconstant *GL-TEXTURE-ENV-MODE*                 #x2200)
(defconstant *GL-TEXTURE-ENV-COLOR*                #x2201)

;; TextureEnvTarget 
(defconstant *GL-TEXTURE-ENV*                      #x2300)

;; TextureGenMode 
(defconstant *GL-EYE-LINEAR*                       #x2400)
(defconstant *GL-OBJECT-LINEAR*                    #x2401)
(defconstant *GL-SPHERE-MAP*                       #x2402)

;; TextureGenParameter 
(defconstant *GL-TEXTURE-GEN-MODE*                 #x2500)
(defconstant *GL-OBJECT-PLANE*                     #x2501)
(defconstant *GL-EYE-PLANE*                        #x2502)

;; TextureMagFilter 
(defconstant *GL-NEAREST*                          #x2600)
(defconstant *GL-LINEAR*                           #x2601)

;; TextureMinFilter 
;;      GL-NEAREST 
;;      GL-LINEAR 
(defconstant *GL-NEAREST-MIPMAP-NEAREST*           #x2700)
(defconstant *GL-LINEAR-MIPMAP-NEAREST*            #x2701)
(defconstant *GL-NEAREST-MIPMAP-LINEAR*            #x2702)
(defconstant *GL-LINEAR-MIPMAP-LINEAR*             #x2703)

;; TextureParameterName 
(defconstant *GL-TEXTURE-MAG-FILTER*               #x2800)
(defconstant *GL-TEXTURE-MIN-FILTER*               #x2801)
(defconstant *GL-TEXTURE-WRAP-S*                   #x2802)
(defconstant *GL-TEXTURE-WRAP-T*                   #x2803)

;; TextureTarget 
;;      GL-TEXTURE-1D 
;;      GL-TEXTURE-2D 

;; TextureWrapMode 
(defconstant *GL-CLAMP*                            #x2900)
(defconstant *GL-REPEAT*                           #x2901)




(defconstant *GrayScale*		1)
(defconstant *StaticColor*		2)
(defconstant *PseudoColor*		3)
(defconstant *TrueColor*		4)
(defconstant *DirectColor*		5)
