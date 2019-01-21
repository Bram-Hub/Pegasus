;;; -*- Syntax: Ansi-Common-Lisp; Base: 10; Mode: lisp; Package: odcl -*-
;;; $Id: string.lisp,v 1.47 2003/03/24 21:51:31 adam Exp $
;;;
;;; Copyright (c) 2000 - 2003 onShore Development, Inc.

;;;
;;; string manipulation utility procedures
;;;

;(in-package :odcl)

(defun ensure-string (val)
  "Returns VAL as a string (should be merged with coerce-to-string below)."
  (typecase val
    (string
     (princ-to-string val))
    (character
     (princ-to-string val))
    (t
     (prin1-to-string val))))

(defun random-string (&key (length 16))
  "Returns a random alphabetic string."
  (let ((id (make-string length)))
    (do ((x 0 (incf x)))
	(( = x length))
      (setf (aref id x) (code-char (+ 97 (random 26)))))
    id))

(defun string-truncate (string limit)
  "Truncate STRING to a given numeric LIMIT."
  (if (<= (length string) limit)
      string
      (subseq string 0 limit)))

(defun string-pretty-truncate (string limit)
  "Truncate STRING to a given numeric LIMIT, adding ... if needed."
  (if (<= (length string) limit)
      string
      (concatenate 'string (subseq string 0 limit) "...")))

(defun last-char (string)
  "Return the last character in STRING."
  (when (< 0 (length string))
    (aref string (1- (length string)))))

(defun first-char (string)
  "Return the first character in STRING."
  (when (< 0 (length string))
    (aref string 0)))

(defun filter-list (pred list)
  "Return elts of LIST which match the PRED function."
  (labels ((rec (lst accum)
             (if (null lst)
                 (reverse accum)
                 (if (funcall pred (car lst))
                     (rec (cdr lst) (cons (car lst) accum))
                     (rec (cdr lst) accum)))))
    (rec list nil)))
 
(defun split-string (char string)
  "Return the elements of STRING separated by CHAR as values."
  (let ((index (position char string)))
    (if index
        (values (subseq string 0 index)
                (subseq string (1+ index)))
        (values string nil))))

(defun find-first-unescaped-char (string char escape start)
  (if (= start (length string)) nil
      (when-bind (position (position char string :start start :test #'char=))
        (cond ((= position start) start)
              ((and escape (char= (elt string (- position 1)) escape))
               (find-first-unescaped-char string char escape (1+ position)))
              (t position)))))

(defun split (string delim &key preserve-empty-strings escape (start 0) max-results)
  (if (or (= start (length string)) (and max-results (< max-results 0)))
      nil
      (if-bind (position (find-first-unescaped-char string delim escape start))
        (if (= position start)
            (if preserve-empty-strings
                (cons ""
                      (split string delim
                                :preserve-empty-strings preserve-empty-strings
				:max-results (if (null max-results) nil
					       (- max-results 1))
                                :escape escape :start (+ position 1)))
                (split string delim
                          :preserve-empty-strings preserve-empty-strings
				:max-results (if (null max-results) nil
					       (- max-results 1))
                          :escape escape :start (+ position 1)))
            (cons (subseq string start position)
                  (split string delim
                            :preserve-empty-strings preserve-empty-strings
				:max-results (if (null max-results) nil
					       (- max-results 1))
                            :escape escape :start (+ position 1))))
          (list (subseq string start (length string))))))
         

#+nil (defun split (string delim &key preserve-empty-strings escape &aux start end result)
  "Splits a string into a list of substrings: (split 'foo:bar:gaz' #\\:)
returns ('foo' 'bar' 'gaz').  Removes empty strings from result unless
:preserve-empty-strings is t."
  (declare (optimize (speed 3))
           (type simple-base-string string))
  (setf start (length string))
  (flet ((scan ()
           (setf end start
                 start (position delim string :from-end t :end end :test #'char=))))
    ;;(setf start (position delim string :from-end t :end end :test #'char=)))
    (scan)
    (while start
      (when (or preserve-empty-strings (< 0 (- end (1+ start))))
        (if (and escape (char= escape (elt string (max (1- start) 1))))
            (push (subseq string start end) result)
            (push (subseq string (1+ start) end) result)))
      (scan))
    (if (< 0 end)
        (push (subseq string 0 end) result)
        (when preserve-empty-strings
          (push "" result)))
    result))

(defun split-counted (string delim count)
  (split string delim :max-results count))

#+nil(defun split-counted (string delim count)
     "Splits a STRING into a list of substrings, up to a given COUNT of
substrings.  Removes empty strings from result."
  ;; FIXME: shouldn't this be merged with split ?
  (unless (characterp delim)
    (error "Delimiter is not a character"))
  (labels ((%internal (string delim count)
             (let ((div (position delim string :from-end t)))
               (cond
                 ((or (null div) (= count 0)) ;; no delimiter
                  (list string))
                 ((= div 0) ;; delimiiter at beginning of string
                  (split (subseq string (1+ div) (length string)) delim))
                 ((= (1+ div) (length string)) ;; delimiter at end of string
                  (list (subseq string 0 div)))
                 (t
                  (cons (subseq string (1+ div) (length string))
                        (%internal (subseq string 0 div) delim (1- count))))))))
    (reverse (%internal string delim count))))

(defun string-join (string-list &optional (delim " "))
  "Join a list of strings, delimited with DELIM, into one big string
and return it."
  (typecase delim
    (base-char
     (setq delim (char-to-string delim))))
  (etypecase string-list
    (list
     (let ((s (make-string-output-stream)))
       (write-string (%coerce-to-string (car string-list)) s)
       (dolist (x (cdr string-list))
         (write-string delim s)
         (write-string (%coerce-to-string x) s))
       (get-output-stream-string s)))
    (string
     string-list)))

(defun %coerce-to-string (seq)
  "Returns SEQ as a string (should be merged with ensure-string above?)."
  (etypecase seq
    (string seq)
    (sequence
     (let ((string (make-string (length seq))))
       (dotimes (x (length seq))
         (setf (aref string x)
               (code-char (aref seq x))))
       string))))

(defun char-replace (char char2 string)
  "Replace all instances of CHAR with CHAR2 in STRING and return it."
  (let ((string (copy-seq string)))
    (dotimes (i (length string))
      (when (char= char (aref string i))
        (setf (aref string i) char2)))
    string))

(defun string-extend (string new-len &key (initial-element #\Space))
  (let ((string-b (make-string new-len :initial-element initial-element)))
    (overlay string-b string 0)))

(defun overlay (string-a string-b offset)
  "Destructively Superimpose STRING-B over STRING-A starting at OFFSET."
  ;(let ((string (copy-seq string-a)))
    (when (< (length string-a) (+ offset (length string-b)))
      (setf string-a (string-extend string-a (+ offset (length string-b)))))
    (dotimes (i (length string-b))
      (setf (aref string-a (+ offset i))
	    (aref string-b i)))
    string-a)

(defun char-count (char string)
  "Return the number of incidences of CHAR in STRING."
  (let ((count 0))
    (dotimes (i (length string))
      (when (char= char (aref string i))
        (incf count)))
    count))

(defun string-or-nil (string)
  "After trimming any surrounding spaces, return NIL if STRING is
not a string at all or an empty string.  Otherwise, return the string."
  (typecase string
    (string
     (let ((string (string-trim " " string)))
       (when (< 0 (length string))
         string)))))

(defun strcat (ids &optional (delim " "))
  "Given a list of IDS, concatenate them into a string delimited by
DELIM, trim any surrounding DELIM, and return that string."
  (let ((str ""))
    (when ids
      (dolist (id (reverse ids))
        (setf str (concatenate 'string delim id str))))
    (string-trim delim str)))

(defun write-padded (count string stream)
  (write-space stream count)
  (write-string string stream))

(defun write-space (stream &optional (count 1))
  (dotimes (x count)
    (write-string "&nbsp;" stream)))

(defun string-replace (char replace-text string)
  (let ((count (char-count char string)))
    (if (= 0 count)
        (copy-seq string)
        (let* ((orig-length (length string))
               (repl-length (length replace-text))
               (new-length (+ orig-length (* (- repl-length 1) count)))
               (new-string (make-string new-length))
               (j 0))
          (do ((i 0 (incf i)))
              ((= i orig-length) new-string)
            (let ((test-char (aref string i)))
              (cond ((char= test-char char)
                     (overlay new-string replace-text j)
                     (incf j repl-length))
                    (t
                     (setf (aref new-string j) test-char)
                     (incf j)))))))))

(defun strip-character (char string)
  (let ((count (char-count char string)))
    (if (= 0 count)
        (copy-seq string)
        (let* ((orig-length (length string))
               (new-length (- orig-length count))
               (new-string (make-string new-length))
               (j 0))
          (do ((i 0 (incf i)))
              ((= i orig-length) new-string)
            (let ((test-char (aref string i)))
              (cond ((char= test-char char)
                     nil)
                    (t
                     (setf (aref new-string j) test-char)
                     (incf j)))))))))

(defun strip-characters (charbag str)
  (let ((val str))
    (dolist (char charbag)
      (setq val (strip-character char val)))
    val))

(defun replace-char (in a b)
  (let ((out (make-string (length in))))
    (dotimes (i (length in))
      (let ((char (aref in i)))
        (if (char= char a)
            (setf (aref out i) b)
            (setf (aref out i) char))))
    out))

;; like search but allows for an escape character to nullify matches.
;; this needs to be brought more in line with the param list for
;; search.  for now it only accepts the :start2 keyword param
;; also needs to have more robust handling of escaped escape characters
;; and, what happens if the search sequence begins with the escape char.
(defun search-escaped (seq1 seq2 &key (start2 0) (escape-char #\\))
  (let ((index (search seq1 seq2 :start2 start2)))
    (cond ((or (null index) (eq 0 index)) index)
          ((char-equal (elt seq2 (- index 1)) escape-char)
           (if (eql (- 1 (length seq2)) index)
               nil
               (search-escaped seq1 seq2 :start2 (+ 1 index) :escape-char escape-char)))
          (t index))))

;; takes a template and an alist of symbol->value and returns a filled-in
;; instance of the template

(defun fill-template (values template
                      &key
                      (sub-delim "$")
                      (escape-char #\\)
                      (template-resolver))
  (let* ((start-index (search-escaped sub-delim template :escape-char escape-char))
         (end-index (cond ((null start-index) nil)
                          ((eql (- (length template) 1) start-index) start-index)
                          (t (search-escaped sub-delim template
                                             :start2 (+ 1 start-index)
                                             :escape-char escape-char)))))
    (cond ((null start-index) template)
          ((null end-index) (error "null end index"))
          ((eq start-index end-index) (error" start = end"))
          (t (concatenate 'string (subseq template 0 start-index)
                          (let ((value (subseq template (+ start-index 1) end-index)))
                            (string-join
                             (if template-resolver
                                 (funcall template-resolver values value)
                                 (or (cdr (assoc value values :test #'equalp))
                                     (error "unknown tempate key ~A" value)))
                             ", "))
                          (fill-template values (subseq template (+ 1 end-index))
                                         :sub-delim sub-delim
                                         :template-resolver template-resolver
                                         :escape-char escape-char))))))

(defun stringify (symbol)
  (etypecase symbol
    (symbol (symbol-name symbol))
    (string symbol)))

(defun string-to-array (string)
  (let* ((length (length string))
         (array  (make-array length)))
    (do ((i 0 (incf i)))
        ((= i length))
      (setf (aref array i)
            (char-code (aref string i))))
    array))

(defun array-to-string (string)
  (let* ((length (length string))
         (array  (make-string length)))
    (do ((i 0 (incf i)))
        ((= i length))
      (setf (aref array i)
            (code-char (aref string i))))
    array))

;;;
;;; These should be string-munging functions and macros.
;;;

;;
;; 't' if a string is non-nil and non-zero-length
;;

(defun nonempty (string)
  (and string (< 0 (length string))))

;;
;; Return a string with a space tacked on the end.
;;

(defun padstring (string)
  (cond ((null string)
	 "")
	(t
	 (concatenate 'string string " "))))

;;
;; String character replacement
;;

(defun char-to-char-in-string (str char1 char2)
  "Replace CHAR1 with CHAR2 throughout STR."
  (do ((pos (position char1 str) (position char1 str)))
      ((not pos) str)
    (setf (char str pos) char2)))

(defun string-replacing-char (str char1 char2)
  "Return a copy of STR with CHAR1 replaced everywhere by CHAR2."
  (char-to-char-in-string (copy-seq str) char1 char2))

;;
;; Generic stringy thingies
;;

(defmacro string-empty-p (str)
  (list 'string= str ""))

(defun string-nil-or-empty-p (str)
  (or (not str)  (string= str "")))

(defun y-or-n-string (value)
  (if value "Yes" "No"))

;; (operate-on-string "hello kitty" '((0 "j") ((6 10) "doggy"))) => "jello doggy"
;;
;; nondestructive.

(defun char-to-string (char)
  (let ((string (make-string 1)))
    (setf (aref string 0) char)
    string))

(defun operate-on-string (string control &aux result start end)
  (setf result (copy-seq string))
  (dolist (control control)
    (let ((spec (first control))
          (val  (second control)))
      (typecase spec
        (atom (setf start spec end (1+ spec))
              (etypecase val
                (character
                 (setf val (char-to-string val)))
                (string t)))
        (list (setf start (first spec) end (1+ (second spec)))))
      (dotimes (i (- end start))
        (setf (aref result (+ i start))
              (aref val i)))))
  result)

(defun wrap-text (text &key (cols 75))
  "Split a string into substrings of no more than length COLS, split at whitespace"
  (let ((string-list nil)
	(chars-read 0)
	(stream (make-string-output-stream))
	(tokens (string-replacing-char (split text #\space) #\newline #\space)))
    (dolist (token tokens)
      (when (> (+ chars-read (length token) 1) cols)
	  (if (equal 0 chars-read) (error "Cannot wrap text")
	    (progn
	      (push (get-output-stream-string stream) string-list)
	      (setf chars-read 0))))
      (let ((string (format nil "~[ ~;~]~A" (if (eql chars-read 0) 1 0) token)))
	(format stream "~A" string)
	(setf chars-read (+ chars-read (length string)))))
    (push (get-output-stream-string stream) string-list)
    (reverse string-list)))

(defun escape-string (string map)
  ;; escape the characters in MAP in STRING.  This is an easy way of
  ;; doing it but I haven't thought abut making it efficient.
  (declare (type string string))
  (flet ((%needsescape (ch)
           (etypecase map
             (list
              (assoc ch map))
             (function
              (funcall map ch))))
         (%escapechar (ch)
           (etypecase map
             (list
              (cdr (assoc ch map)))
             (function
              (funcall map ch)))))
    (if (not (find-if #'%needsescape
                      string))
        string
        (with-output-to-string (o)
          (loop for prev = 0 then (1+ found)
                for found = (position-if #'%needsescape
                                         string
                                         :start prev)
                while found
                do
                (write-sequence string o :start prev :end found)
                (write-sequence (%escapechar (char string found)) o)
                finally
                (write-sequence string o :start prev :end (length string)))))))

;;; strcoll defined in libc.lisp
#+(or cmu sbcl)
(defun collated-string< (x y)
  (< 0 (strcoll (string-upcase y) (string-upcase x))))

#+(or cmu sbcl)
(defun collate-strings (x y)
 (strcoll (string-upcase y) (string-upcase x)))

;; remove consecutive duplicates from seq, optionaly only remove
;; elements matching :element
(let* ((no-option (gensym)) (last no-option))
  (defun uniq (seq &key (element no-option) (test #'eq))
    (remove element seq
	    :test (lambda (x y)
		    (prog1
			(and (or (eq x no-option) (apply test (list x y)))
			     (not (eq last no-option))
			     (apply test (list last y)))
		      (setf last y))))))
