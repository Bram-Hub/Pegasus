;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                  ;
;  PEGASUS - Proof using Existential Graphs                                        ;
;  Version 1.0                                                                     ;
;  Written by Andrew Shilliday                                                     ;
;  04/29/04                                                                        ;
;                                                                                  ;
;  Two lines of a properly formated pega file are shown below.                     ;
;                                                                                  ;
;  DC:(A|B|C|(D|E|F|[-(([/G|H|]))]A|C|)                                            ;
;  ER:([-A|]B|C|(D|E|F|G|H|A|C|)                                                   ;
;                                                                                  ;
;  The first two chars (DC and ER) represent the rule that is being used in the    ;
;  particular step, and that rule will be displayed at the top of the screen       ;
;  during playback.  The letters followed by pipes represent single propositions.  ;
;  The parentheses are cuts (an EG term which is displayed as a cicle enclosing    ;
;  the elements of the cuts).  And the brackets followed by operators are modifer  ;
;  commands that tell the program which elements the rule is being applied to.     ;
;                                                                                  ;
;  [-  - the stuff coming after is to be removed                                   ;
;  [/  - the following elements should be treated as normal.                       ;
;  [+  - the items are being added                                                 ;
;  [.  - the elements are used as citation for the rule that's                     ;
;        being used (these elements will be highlighted).                          ;
;                                                                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;
;; INITIALIZATION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load (current-pathname "./opengl/load.lisp"))
(load (current-pathname "./string.lisp"))

(defun pegasus (&optional file-to-open)
  "Initializes the pegasus window and opens a file if asked"
  (let ((interface (make-instance 'pegasus-interface)))
    (capi:display interface)
    (when file-to-open
      (pegasus-open-file interface file-to-open))))

;;;;;;;;;;;;;;;;
;; PARAMETERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Animation starts automatically when file loads,
;; you can set this to nil to change that.
(defparameter *pegasus-auto-play-on-load* nil)

;; Change this parameter to specify the time
;; lapse between frames of animation (in milliseconds).
;; Currently set to 22 frames per second
(defparameter *pegasus-timer-interval* 45)

;; Change this parameter to specify the amount of the phase
;; each timer tick moves.  (must be between 1 and 100)
(defparameter *pegasus-frame-interval* 10)

;; This parameter specifies the space from the edge
;; of the canvas to the graph when in zoom-lock mode
(defparameter *pegasus-canvas-border-gap* 200.0)

;; Spacing between elements in the graph
(defparameter *pegasus-element-gap* 50)

;;Do not change these parameters
(defparameter *pegasus-font-path* (current-pathname "MonoRoman.stroke"))
(defparameter *pegasus-char-width*  100)
(defparameter *pegasus-char-height* 100)

;;;;;;;;;;;;;;;;;;;;;;;
;; CLASS DEFINITIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; This class is used by the file parser, it is not         
;; used by pegasus during the animation
;;
(defclass pegasus-graph () 
  ((action :initform :none :initarg :action :accessor action)
   (data   :initform nil   :initarg :data   :accessor data)))

;;
;; This class contains information on the animation
;; displayed by the interface.  It contains the data
;; pinpointing where in the animation we are, and a 
;; list of chapters each representing one step in the
;; proof. 
;;
(defclass pegasus-animation ()
  ((current-action  :initform :pause)
   (current-chapter :initform 0)
   (current-phase   :initform 0)
   (current-frame   :initform 0)
   (chapters        :initform nil :initarg :chapters :accessor chapters)))

;;
;; A Chapter represents one line in the proof file
;; The cooresponds to one step in the proof. The class
;; contains information on the rule used in the step
;; as well as the phases that are animated
;;
(defclass pegasus-chapter ()
  ((rule   :initform nil :initarg :rule   :accessor rule)
   (phases :initform nil :initarg :phases :accessor phases)))

;;
;; Each chapter in the animation has phases which
;; include highlighting, erasing, inserting, and
;; resizing.  
;;
(defclass pegasus-phase ()
  ((width    :initform nil :initarg :width    :accessor width)
   (height   :initform nil :initarg :height   :accessor height)
   (elements :initform nil :initarg :elements :accessor elements)))

;;
;; The main pegasus interface.
;; 
;; - left, right, top, bottom are variables used to determin
;;   what objects will be displayed (changed by panning and zooming)
;;
;; - lastxy is a temp variable to track user mouse movement
;;
;; - timer stores the lispworks timer used to trigger the animation
;;   events
;;
(capi:define-interface pegasus-interface () 
  ((animation :initform nil :initarg :animation :accessor animation)
   (left :initform nil)
   (right :initform nil) 
   (bottom :initform nil)
   (top :initform nil)
   (lastxy :initform nil)
   (canvas-width  :initform nil)
   (canvas-height :initform nil)
   (font-base :initform nil :accessor font-base)
   (timer :initform nil :accessor timer)
   (timer-step-size
    :accessor timer-step-size
    :initform (make-instance 
               'capi:slider :start 1 :end 50 :title "Speed:"
               :slug-start *pegasus-frame-interval*
               :title-position :LEFT
               :visible-min-width 100
               :visible-border nil
               :callback 'change-timer-step-size))
   (rule-text :initform (make-instance 'capi:display-pane
                                       :visible-min-width '(:character 27)
                                       :visible-min-height '(:character 1)
                                       :visible-max-height '(:character 5)
                                       :visible-max-width nil
                                       :foreground :white
                                       :background :black
                                       :visible-border nil)
              :accessor rule-text)
   (lock-zoom-button 
    :initform 
    (make-instance 'capi:toolbar-button 
                   :image 13
                   :selection-callback 'press-lock-zoom-button
                   :retract-callback 'press-lock-zoom-button
                   :selected t
                   :callback-type :item-interface
                   :tooltip "Ensures that all of the graph is always visible"))
   (open-file-button :initform (make-instance 'capi:toolbar-button
                                              :image 7
                                              :callback 'press-open-file-button
                                              :tooltip "Open a new EG proof file"))
   (close-file-button :initform (make-instance 'capi:toolbar-button
                                               :tooltip "Close current open file"
                                               :image 5
                                               :callback 'press-close-file-button))
   (control-toolbar  
    :accessor control-toolbar
    :initform
    (make-instance 'capi:toolbar-component
                   :interaction :single-selection
                   :selected-item 3
                   :items (list (make-instance 
                                 'capi:toolbar-button
                                 :image (load-button-image "jump-back")
                                 :data "jump-back"
                                 :selection-callback 'press-jump-backwards)
                                (make-instance
                                 'capi:toolbar-button
                                 :image (load-button-image "step-back")
                                 :data "step-back"
                                 :selection-callback 'press-step-backwards)
                                (make-instance 
                                 'capi:toolbar-button
                                 :image (load-button-image "play-back")
                                 :data "play-back"
                                 :selection-callback 'press-play-backwards)
                                (make-instance 
                                 'capi:toolbar-button
                                 :image (load-button-image "pause")
                                 :data "pause"
                                 :selection-callback 'press-pause)
                                (make-instance
                                 'capi:toolbar-button
                                 :image (load-button-image "play-forward")
                                 :data "play-forward"
                                 :selection-callback 'press-play-forwards)
                                (make-instance 
                                 'capi:toolbar-button
                                 :image (load-button-image "step-forward")
                                 :data "step-forward"
                                 :selection-callback 'press-step-forwards)
                                (make-instance 
                                 'capi:toolbar-button
                                 :image (load-button-image "jump-forward")
                                 :data "jump-forward"
                                 :selection-callback 'press-jump-forwards)))))

  (:panes
   (toolbar1 capi:toolbar
            :orientation :horizontal
            :items (list (make-instance 'capi:toolbar-component
                              :items  (list open-file-button close-file-button))
                         (make-instance 'capi:toolbar-component
                              :items (list lock-zoom-button)
                              :interaction :multiple-selection)
                         (make-instance 'capi:toolbar-component
                              :items (list control-toolbar))
                         (make-instance 'capi:row-layout
                                        :children (list timer-step-size)))) 
   (canvas capi:opengl-pane
           :configuration (list :rgba t :depth nil :double-buffered t)
           :min-width 400
           :min-height 400
           :display-callback 'redisplay-canvas
           :resize-callback 'resize-canvas
           :reader canvas
           :visible-border nil
           :input-model '(((:button-1 :press)  canvas-button-1-press-a)
                          ((:button-2 :press)  canvas-button-2-press-a)
                          ((:button-1 :shift :press)  canvas-button-2-press-a)
                          ((:button-3 :press)  canvas-button-2-press-a)
                          ((:motion :button-1) canvas-button-1-move-a)
                          ((:motion :button-2) canvas-button-2-move-a)
                          ((:motion :button-3) canvas-button-2-move-a))
           :font (gp:make-font-description :family "Arial")))
  (:layouts 
   (main-layout capi:column-layout
                '(toolbar1 canvas rule-text)
                :adjust :left))
  (:default-initargs
   :title "Pegasus"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIALIZATION MEATHOD ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod capi:interface-display :after ((interface pegasus-interface))
  "Called when interface is displayer, initializes certain variables"
  (declare (ignore args))
  (pegasus-close-file interface)
  (setf (timer interface) (mp:make-timer 'timer-function interface))
  (with-slots (canvas) interface
    (resize-canvas (canvas interface) 0 0 
                   (gp:port-width canvas) 
                   (gp:port-height canvas))))

;;;;;;;;;;;;;;;;;;;;;;;
;; DISPLAY FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; This function modifies the pan and zoom of the animation
;; for the best possible view.  When the 'lock zoom' button
;; it pressed, this function gets called at every step in
;; the animation"
;;
(defun reset-pegasus-interface (i)
  "Resets the pan and zoom of the canvas"
  (with-slots (canvas-width canvas-height animation
               left right top bottom) i
    (when animation
      (with-slots (current-phase current-chapter current-frame chapters) animation
        (with-slots ((w1 width) (h1 height))
            (nth current-phase (phases (nth current-chapter chapters)))
          (with-slots ((w2 width) (h2 height))
              (nth (+ 1 current-phase) (phases (nth current-chapter chapters)))
            (let* ((_w (calculate-intermediate w1 w2 current-frame))
                   (_h (calculate-intermediate h1 h2 current-frame))
                   (screen-ratio (/ canvas-width (max 1.0 canvas-height)))
                   (w (+ _w (* *pegasus-canvas-border-gap* 2)))
                   (h (/ w screen-ratio)))
              (setf left   (float (- (/ w -2.0) (/ _w -2.0)) 1.0d0))
              (setf right  (float (+ (/ w 2.0)  (/ _w 2.0)) 1.0d0))
              (setf bottom (float (+ (/ h -2.0) (/ _h 2.0)) 1.0d0))
              (setf top    (float (+ (/ h 2.0)  (/ _h 2.0)) 1.0d0))
              (redisplay-canvas (canvas i)))))))))

;;
;; This function is called whenever the canvas needs
;; to be refreshed.
;;
 (defun redisplay-canvas (canvas &rest args)
   "Displayed the current frame of the animation"
   (declare (ignore args))
   (with-slots ((i capi:interface)) canvas
     (with-slots (animation font-base left right bottom top) i
       (opengl:rendering-on (canvas)
         (unless font-base (setf font-base (init-font)))
         (opengl:gl-clear opengl:*gl-color-buffer-bit*)
         (opengl:gl-matrix-mode opengl:*gl-projection*)
         (opengl:gl-load-identity)
         (when left
           (opengl:gl-ortho (float left 1.0d0) 
                            (float right 1.0d0) 
                            (float bottom 1.0d0) 
                            (float top 1.0d0) 
                            (float -1.0 1.0d0)
                            (float 1.0 1.0d0)))
         (opengl:gl-matrix-mode opengl:*gl-modelview*)
         (opengl:gl-load-identity)
         (when animation
           (display-animation animation font-base (rule-text i) ))
         (opengl:swap-buffers canvas)))))

(defun display-animation (animation font-base rule-display-pane)
  "Prints the animation objects to the canvas"
  (with-slots (current-chapter current-phase current-frame chapters) animation
    (let* ((chapter (nth current-chapter chapters))
           (phase1  (nth current-phase  (phases chapter)))
           (phase2  (nth (+ current-phase 1) (phases chapter)))
           (rule-str (case (rule chapter)
                       ('DC ": DOUBLE CUT")
                       ('ER ": ERASURE")
                       ('IT ": ITERATION")
                       ('IN ": INSERTION")
                       (otherwise ""))))
      (when (not (equal (capi:display-pane-text rule-display-pane) rule-str))
        (mp:process-run-function 
         'p2 nil (lambda ()
                   (setf (capi:display-pane-text rule-display-pane)
                         (format nil "Step ~A of ~A~A" (+ 1 current-chapter )
                                 (length chapters) rule-str)))))
      (loop for e1 in (elements phase1) for e2 in (elements phase2) do
         (let ((text (first e1))
               (data (mapcar (lambda (x y)
                               (calculate-intermediate x y current-frame)) 
                             (cdr e1) (cdr  e2))))
           (opengl:gl-color4-f (float (fifth data))
                               (float (sixth data))
                               (float (seventh data))
                               (float (eighth data)))                               
           (if (stringp text) ; Draw an atom or cut
               (draw-string text 
                            (float (first data) 1.0d0) 
                            (float (second data) 1.0d0)
                            font-base)
             (draw-rounded-rectangle (float (first data)) (float (second data))
                                     (float (third data)) (float (fourth data))
                                     25)))))))


(defun draw-rounded-rectangle (x y w h r &optional (p 3))
  (opengl:gl-begin opengl:*gl-line-loop*)
  (opengl:gl-vertex2-f x (+ y r))
  (opengl:gl-vertex2-f x (+ y h (- r)))
  
  (opengl:gl-vertex2-f (+ x r) (+ y h))
  (opengl:gl-vertex2-f (+ x (- r) w) (+ y h))

  (opengl:gl-vertex2-f (+ x w) (+ y h (- r)))
  (opengl:gl-vertex2-f (+ x w) (+ y r))

  (opengl:gl-vertex2-f (+ x w (- r)) y)
  (opengl:gl-vertex2-f (+ x r) y)
  
  (opengl:gl-end))

  
  
;;
;; Draws a string of text to the canvas
;;
(defun draw-string (str x y font-base)
  (opengl:gl-push-matrix)
  (opengl:gl-Translatef (float x 1.0) (float y 1.0) 0.0)
  (map nil (lambda (c)
             (opengl:gl-call-list (+ (char-code c) font-base -1))
             (opengl:gl-Translatef 100.0 0.0 0.0))
       str)            
  (opengl:gl-pop-matrix))


;;;;;;;;;;;;;;;;;;;;;;;;
;; CALLBACK FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

(defun change-timer-step-size (slider value &rest args)
  (declare (ignore args))
  #+Darwin   ;In darwin, this operation must stop the animation
  (with-slots ((interface capi:interface)) slider
    (capi::choice-user-move-selection (control-toolbar interface) 3)))
  
;;
;; Called whenever the canvas is resized
;;
(defun resize-canvas (canvas x y new-width new-height)
  "Initializes the viewport to the correct dimensions"
  (declare (ignore x y))
  (with-slots ((interface capi:interface)) canvas
    (with-slots (left right top bottom 
                 (old-width canvas-width) 
                 (old-height canvas-height)) interface
      (opengl:rendering-on (canvas)
         (opengl:gl-viewport 0 0 new-width new-height)
         (opengl:gl-enable opengl:*gl-line-smooth*)
         (opengl:gl-polygon-mode opengl:*gl-front* opengl:*gl-line*)
         (opengl:gl-line-width 2.0)
         (opengl:gl-Enable opengl:*GL-BLEND*)
         (opengl:gl-Blend-Func opengl:*GL-SRC-ALPHA*
                               opengl:*GL-ONE-MINUS-SRC-ALPHA*)
         ;initialize dimensions
         (if (not left)   (setf left   (/ (float new-width 1.0d0)  -2.0)))
         (if (not right)  (setf right  (/ (float new-width 1.0d0)   2.0)))
         (if (not bottom) (setf bottom (/ (float new-height 1.0d0) -2.0)))
         (if (not top)    (setf top    (/ (float new-height 1.0d0)  2.0)))
         (if (not old-width) (setf old-width new-width))
         (if (not old-height) (setf old-height new-height))
         (let* ((vw (- right left))               ;ortho width
                (vh (- top bottom))               ;ortho height
                (dh (- new-height old-height))    ;change in window height
                (dw (- new-width old-width)))     ;change in window width
           (incf right (* (/ dw old-width) vw))
           (decf bottom (* (/ dh old-height) vh)))
         (setf old-width new-width)
         (setf old-height new-height))))
    (redisplay-canvas canvas))

(defun press-open-file-button (data interface)
  "Called when the 'open file' button is pressed"
  (declare (ignore data))
  (pegasus-open-file 
   interface
   (capi:prompt-for-file
    "Please choose a file to open" 
    :filter "*.PEGA"
    :filters '("Pegasus Proof Files"  "*.PEGA;*.PEG" "All Files" "*.*"))))

(defun press-close-file-button (data interface)
  "Called when the 'close file' button is pressed"
  (declare (ignore data))
  (pegasus-close-file interface))

(defun press-lock-zoom-button (data i)
  "Locks the pan and zoom to the optimal location"
  #+Darwin   ;In darwin, this operation must stop the animation
  (capi::choice-user-move-selection (control-toolbar i) 3) 
  (when (capi:item-selected data)
    (reset-pegasus-interface i)))

(defun press-play-forwards (data interface)
  "Begins the animation"
  (declare (ignore data))
  (mp:schedule-timer-relative-milliseconds 
   (timer interface) *pegasus-timer-interval* *pegasus-timer-interval*))

(defun press-play-backwards (data interface)
  "Begins the animation in the reverse direction"
  (declare (ignore data))
  (mp:schedule-timer-relative-milliseconds 
   (timer interface) *pegasus-timer-interval* *pegasus-timer-interval*))

(defun press-pause (data interface)
  "Pauses the animation"
  (declare (ignore data))
  (mp:unschedule-timer (timer interface)))

(defun press-step-forwards (data interface)
  "Goes ahead one chapter"
  (declare (ignore data))
  (pegasus-advance-chapter interface 1)
  (capi::choice-user-move-selection (control-toolbar interface) 3) 
  (if (capi:item-selected (slot-value interface 'lock-zoom-button))
      (reset-pegasus-interface interface)
    (redisplay-canvas (canvas interface))))

(defun press-step-backwards (data interface)
  "Go back one chapter"
  (declare (ignore data))
  (pegasus-advance-chapter interface -1)
  (capi::choice-user-move-selection (control-toolbar interface) 3)  
  (if (capi:item-selected (slot-value interface 'lock-zoom-button))
      (reset-pegasus-interface interface)
    (redisplay-canvas (canvas interface))))

(defun press-jump-forwards (data interface)
  "Jump to the end of the animation"
  (declare (ignore data))
  (pegasus-advance-chapter 
   interface (length (slot-value (animation interface) 'chapters)))
  (pegasus-advance-phase interface 10)
  (pegasus-advance-frame interface 1.0)
  (capi::choice-user-move-selection (control-toolbar interface) 3)  
  (if (capi:item-selected (slot-value interface 'lock-zoom-button))
      (reset-pegasus-interface interface)
    (redisplay-canvas (canvas interface))))


(defun press-jump-backwards (data interface)
  "Jump to the beginning of the animation"
  (declare (ignore data))
  (pegasus-advance-chapter
   interface (- (length (slot-value (animation interface) 'chapters))))
  (pegasus-advance-phase interface -10)
  (pegasus-advance-frame interface -1.0)
  (capi::choice-user-move-selection (control-toolbar interface) 3)  
  (if (capi:item-selected (slot-value interface 'lock-zoom-button))
      (reset-pegasus-interface interface)
    (redisplay-canvas (canvas interface))))

(defun canvas-button-1-press-a (canvas x y)
  "Occurs when left button is pressed over the canvas"
  (with-slots ((i capi:interface)) canvas
    (with-slots (lastxy) i
      #+Darwin ;In Darwin, animation must be stopped
      (capi::choice-user-move-selection (control-toolbar i) 3) 
      (setf lastxy (cons x y)))))

(defun canvas-button-2-press-a (canvas x y)
  "Occurs when right button is pressed over the canvas"
  (with-slots ((i capi:interface)) canvas
    (with-slots (lastxy) i
      #+Darwin ;In Darwin, animation must be stopped
      (capi::choice-user-move-selection (control-toolbar i) 3) 
      (setf lastxy (cons x y)))))

(defun canvas-button-1-move-a (canvas x1 y1)
  "Pans the canvas"
  (with-slots ((interface capi:interface)) canvas
    (with-slots ((a animation) lastxy left right top bottom) interface
      (setf (capi:item-selected (slot-value interface  'lock-zoom-button)) nil)
      (let* ((dx (- (car lastxy) x1))
             (dy (- (cdr lastxy) y1))
             (x  (* (- right left) (/ dx (slot-value interface 'canvas-width))))
             (y  (* (- top bottom) (/ dy (slot-value interface 'canvas-height)))))
        (incf left x)
        (incf right x)
        (decf bottom y)
        (decf top y)         
        (setf lastxy (cons x1 y1))
        (redisplay-canvas canvas)))))

(defun canvas-button-2-move-a (canvas x1 y1)
  "Zoom the canvas"
  (with-slots ((i capi:interface)) canvas
    (with-slots (lastxy left right bottom top canvas-width canvas-height) i
      (setf (capi:item-selected (slot-value i 'lock-zoom-button)) nil)
      (let* ((x (- (car lastxy) x1))
             (y (- (cdr lastxy) y1))
             (delta (if (> (abs x) (abs y)) x y)))
        (let* ((old-width (- right left))
               (new-width (+ old-width (* 2 (/ delta canvas-width) old-width)))
               (old-height (- top bottom))
               (new-height (* (/ old-height old-width) new-width))
               (dx (/ (- new-width old-width) 2.0))
               (dy (/ (- new-height old-height) 2.0)))
          (decf left dx)
          (incf right dx)
          (decf bottom dy)
          (incf top dy)
          (setf lastxy (cons x1 y1))))
      (redisplay-canvas canvas))))



;;;;;;;;;;;;;;;;;;;;;
;; OTHER FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;;
;; Given two numbers x and y and an real number, i, between 0 and 1,
;; this function calulates the number that is i% from x to y
;;
(defun calculate-intermediate (x y i)
  (+ x (* (- y x) i)))

;;
;; Returns t if two phases are equal, this is used to 
;; eliminate adjacent phases if no action takes place
;;
(defun phase-equal-p (a b)
  (and (equal (width a) (width b))
       (equal (height a) (height b))
       (equal (elements a) (elements b))))

;;
;; Loads an image for the animation control toolbar
;;
(defun load-button-image (x)
  (let ((ext-image (gp:read-external-image
                    (current-pathname (concatenate 'string "./images/" x ".bmp")))))
    (gp:compress-external-image ext-image)
    (setf (gp:external-image-transparent-color-index ext-image) 1)
    ext-image))

;;
;; Occurs when the timer expires, this advances the animation
;; one frame.
;;
(defun timer-function (interface &rest args)
  (declare (ignore args))
  (let* ((obj (control-toolbar interface))
         (choice (capi:item-data (capi:choice-selected-item obj)))
         (step-size (/ (capi:range-slug-start (timer-step-size interface)) 100))
         (step (cond 
                ((string-equal choice "play-forward") step-size)
                ((string-equal choice "play-back") (- step-size)))))
    (if (null (animation interface))
        (mp:process-run-function 'goto-pause nil
                                 'capi::choice-user-move-selection obj 3)
      (when step
        (when (not (pegasus-advance-frame interface step))
          (mp:process-run-function 'goto-pause nil
                                   'capi::choice-user-move-selection 
                                   obj 3))
        (if (capi:item-selected (slot-value interface 'lock-zoom-button))
            (reset-pegasus-interface interface)
          (redisplay-canvas (canvas interface)))))))

;;
;; handles advancing a frame, calls pegasus-advance-phase if needed
;;
(defun pegasus-advance-frame (interface n)
  (with-slots ((current-frame current-frame)) (animation interface)
    (let ((old-frame current-frame))
      (incf current-frame n)
      (cond
       ((>= current-frame 1) 
        (setf current-frame (if (pegasus-advance-phase interface 1) 0 1)))
       ((< current-frame 0)
        (setf current-frame (if (pegasus-advance-phase interface -1) 1 0))))
      (not (eq current-frame old-frame)))))

;;
;; handles advancing a phase, calls pegasus-advance-chapter if needed
;;
(defun pegasus-advance-phase (interface n)
  (with-slots (current-frame current-phase current-chapter chapters) 
      (animation interface)
    (with-slots (phases) (nth current-chapter chapters)
      (let ((old-phase current-phase))
        (incf current-phase n)
        (setf current-frame 0)
        (cond 
         ((>= current-phase (- (length phases) 1))
          (if (pegasus-advance-chapter interface 1) (setf current-phase 0)
            (setf current-phase (- (length phases) 2))))
         ((< current-phase 0)
          (if (not (pegasus-advance-chapter interface -1)) (setf current-phase 0)
            (setf current-phase 
                  (- (length (phases (nth current-chapter chapters))) 2)))))
        (not (eq current-phase old-phase))))))
         
;;
;; Handles advancing on step in the proof
;;
(defun pegasus-advance-chapter (interface n)
  (with-slots (current-frame current-phase current-chapter chapters)
      (animation interface)
    (let ((old-chapter current-chapter))
      (incf current-chapter n)
      (setf current-phase 0)
      (setf current-frame 0)
      (cond 
       ((>= current-chapter (length chapters))
        (setf current-chapter (- (length chapters) 1)))
       ((< current-chapter 0)
        (setf current-chapter 0)))
      (not (eq current-chapter old-chapter)))))

;;
;; Close the current open file
;;
(defun pegasus-close-file (i)
  (setf (capi:interface-title i) "Pegasus")
  (setf (animation i) nil)
  (setf (capi::display-pane-text (rule-text i))
        "To open a file, click the upper-left button.")
  (with-slots ((children capi::buttons)) (control-toolbar i)
              (loop for x in '(0 1 2 4 5 6) do
                    (setf (capi:simple-pane-enabled (nth x children)) nil)))
  (redisplay-canvas (canvas i)))

;;
;; Open a file, parse it, then load it into pegasus
;; 
(defun pegasus-open-file (i file)
  (with-slots (animation) i
    (when file
      (setf animation (ignore-errors 
            (parse-pegasus-file 
             file)))
      (if (null animation)
          (progn
            (capi:display-message "Sorry, but there was an error opening the file.")
            (setf (capi:interface-title i) "Pegasus")) 
        (progn
          (setf (capi:interface-title i) 
                (format nil "Pegasus - ~A" (file-namestring file)))
          (with-slots ((children capi::buttons)) (control-toolbar i)
            (loop for x in '(0 1 2 4 5 6) do
                  (setf (capi:simple-pane-enabled (nth x children)) t)))))
      (reset-pegasus-interface i)
      (when *pegasus-auto-play-on-load*
        (capi::choice-user-move-selection (control-toolbar i) 4)))))
  

;;        
;; This function handles the text that's displayed in 
;; the opengl pane, there was no platform independent
;; font handler in lispworks, so it was necessary to 
;; use stroke fonts (letters made from series of line 
;; segments) the letter definitions were taken from 
;; the glut toolkit and are stored in monoroman.stroke
;;
(defun init-font ()
  (with-open-file (file-stream *pegasus-font-path*)
    (if (null file-stream) -1
      (let (input1 base)
        (setf base (opengl:gl-Gen-Lists 128))
        (opengl:gl-list-base base)
        (loop WHILE (setf input1 (read file-stream nil nil)) DO
          (case input1
            ('BEGIN-CHAR   (opengl:gl-New-List (read file-stream)
                                               opengl:*GL-COMPILE*))
            ('END-CHAR     (opengl:gl-end-list))
            ('BEGIN-STROKE (opengl:gl-Begin opengl:*GL-LINE-STRIP*))
            ('END-STROKE   (opengl:gl-end))
            (otherwise     (opengl:gl-Vertex2-f (float input1 1.0) 
                                                (float (read file-stream) 1.0)))))
        base))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FILE PARSING FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

(defun parse-pegasus-file (file)
  "Main parsing function"
  (make-instance 
   'pegasus-animation 
   :chapters 
   (loop for line in (read-proof-file file) collect
         (make-instance 
          'pegasus-chapter
          :rule (car line)
          :phases (convert-to-phases (make-pegasus-graph (cdr line)))))))

(defun read-proof-file (file)
  "Opens and reads the file"
  (with-open-file (input-stream file)
    (loop for line = (read-line input-stream nil nil)
          until   (not line) 
          when    (not (string-equal line ""))
          collect (format-and-read-string line))))

;;
;; Replace characters in the file to be readable by lisp interpreter
;;
(defun format-and-read-string (str)
  (setf str (substitute #\Space #\| str))
  (setf str (substitute #\Space #\: str))
  (setf str (remove #\[ str))
  (setf str (string-replace #\. " :cite " str))
  (setf str (string-replace #\+ " :add " str))
  (setf str (string-replace #\- " :erase " str))
  (setf str (string-replace #\\ " :none " str))
  (setf str (string-replace #\/ " :none " str))
  (setf str (string-replace #\] " :end " str))
  (read-from-string (format nil " (~A) " str)))

;;
;; Make graph objects from the file
;;
(defun make-pegasus-graph (data &optional (action-stack '(:none)))
  (make-instance
   'pegasus-graph
   :action (first action-stack)
   :data (if (not (listp data)) data
           (loop for x in data append 
                 (case x
                   ((:cite :add :erase :none) (push x action-stack) nil)
                   (:end (pop action-stack) nil)
                   (otherwise (list (make-pegasus-graph x action-stack))))))))

(defun visiblep (phase action)
  "Determines whether an object is visible given a phase and action"
  (case phase
    ((:begin :cite)     (not (eq action :add)))
    ((:expand :add :erase) t)
    ((:shrink :decite ) (not (eq action :erase)))
    (otherwise t)))

;;
;; Assigns the proper color depending on the phase and action of an
;; element
;;
(defun get-color (phase action)
  (cond 
   ((eq action :none)                           (values  1  1  1  1))
   ((and (eq action :cite)  (eq phase :begin))  (values  1  1  1  1))
   ((and (eq action :cite)  (eq phase :cite))   (values  0  0  1 1))
   ((and (eq action :cite)  (eq phase :expand)) (values  0  0  1 1))
   ((and (eq action :cite)  (eq phase :add))    (values  0  0  1 1))
   ((and (eq action :cite)  (eq phase :erase))  (values  0  0  1 1))
   ((and (eq action :cite)  (eq phase :shrink)) (values  1  1  1 1))
   ((and (eq action :cite)  (eq phase :decite)) (values  1  1  1  1))
   
   ((and (eq action :add)   (eq phase :begin))  (values 1 0 0 0))
   ((and (eq action :add)   (eq phase :cite))   (values 1 0 0 0))
   ((and (eq action :add)   (eq phase :expand)) (values 1 0 0 0))
   ((and (eq action :add)   (eq phase :add))    (values 1 0 0 1))
   ((and (eq action :add)   (eq phase :erase))  (values 1 0 0 1))
   ((and (eq action :add)   (eq phase :shrink)) (values 1 0 0 1))
   ((and (eq action :add)   (eq phase :decite)) (values 1 1 1 1))
   
   ((and (eq action :erase) (eq phase :begin))  (values 1 1 1 1))
   ((and (eq action :erase) (eq phase :cite))   (values 1 0 0 1))
   ((and (eq action :erase) (eq phase :expand)) (values 1 0 0 1))
   ((and (eq action :erase) (eq phase :add))    (values 1 0 0 1))
   ((and (eq action :erase) (eq phase :erase))  (values 1 0 0 0))
   ((and (eq action :erase) (eq phase :shrink)) (values 1 0 0 0))
   ((and (eq action :erase) (eq phase :decite)) (values 1 0 0 0))
   
   (t (error (format nil "Bad phase or action when determining color: ~A ~A" 
                     phase action)))))

(defun string-width (str) (* (length (string str)) *pegasus-char-width*))
(defun string-height (str) (declare (ignore str)) *pegasus-char-height*)

;;
;; This function creates the phases that will be places into
;; the interfaces animation object.
;;
(defun convert-to-phases (graph)
  (let ((r 
         (loop for phase in '(:begin :cite :expand :add :erase :shrink :decite) 
               collect
               (multiple-value-bind (objects width height) 
                   (convert-to-objects graph phase 0 0)
                 (make-instance 'pegasus-phase
                                :elements (cdr objects)
                                :width width :height height)))))
    (cons (first r) 
          (loop for x from 1 to 6
                when (not (phase-equal-p (nth x r) (nth (- x 1) r)))
                collect (nth x r)))))
          

(defun convert-to-objects (graph phase _x _y &optional vertp)
  "Takes a pegasus-graph and flattens it to attribute lists.
   We no longer care about depth, so all elements are on the same level"
 (let ((action (action graph))
        (d (data graph))
        (x _x) (y _y) (w 0) (h 0))
    (multiple-value-bind (r g b a) (get-color phase action)
      (if (not (listp d))
        (if (visiblep phase (action graph))
          (values (list (list (string d) x y 
                              (string-width d)
                              (string-height d) r g b a))
                  (string-width d) (string-height d))
          (values (list (list (string d) x y 0 0 r g b a)) 0 0))
        (block apply-to-subelements
          (when (visiblep phase (action graph))
            (setf w *pegasus-element-gap*
                  h *pegasus-element-gap*)
            (incf _x  *pegasus-element-gap*)
            (incf _y  *pegasus-element-gap*))
          (let ((ret-val
                 (loop for e in d append
                   (multiple-value-bind (ret-list width height)
                       (convert-to-objects e phase _x _y (not vertp))
                     (when vertp ;elements are arranged vertically
                       (setf w (max (+ *pegasus-element-gap* width) w))
                       (when (> height 0)
                         (incf h  (+ height *pegasus-element-gap*))
                         (incf _y (+ height *pegasus-element-gap*))))
                     (when (not vertp)
                       (setf h (max (+ *pegasus-element-gap* height) h))
                       (when (> width 0)
                         (incf w  (+ width *pegasus-element-gap*))
                       (incf _x (+ width *pegasus-element-gap*))))
                     ret-list))))
            (if vertp
                (incf w (* *pegasus-element-gap*
                           (if (visiblep phase (action graph)) 1 -2)))
              (incf h (* *pegasus-element-gap* 
                         (if (visiblep phase (action graph)) 1 -2))))
            (when (visiblep phase (action graph))
              (setf w (max w (* 2 *pegasus-element-gap*)))
              (setf h (max h (* 2 *pegasus-element-gap*))))
            (values (cons (list nil x y w h r g b a) ret-val) w h)))))))