; Common Lisp

; global variables

(defparameter *small* 1) ; the earmuffs are style for global variables
(defvar *big* 100) ; if you try to redefine a variable declared with defvar, its value will not change

; global functions

(defun func-name (args)
  ... commands ...)

; local variables

(let ((a 5)
      (b 6))
    (+ a b))

; local functions

(flet ((f (n)
       (+ n 10))
       (g (n)
       (- n 3)))
    (g (f 5)))

; but flet does not make functions available to subsequent functions
; for that, use labels
(labels ((a (n)
         (+ n 5))
         (b (n)
         (+ (a n) 6)))
    (b 10))

; symbols

(eq 'foo 'FoO) ; symbols are case insensitive

; numbers

(+ 1 1.0)
(expt 52 53)    ; raise 52 to the 53rd power
(/ 4 6)         ; result is rational fraction
(/ 4.0 6)       ; result is irrational

; strings

(princ "Prints to the screen") ; also returns the printed value

; lists

(cons 'chicken 'nil)        ; chicken is the only element
(cons 'chicken ())          ; again chicken is the only element
(cons 'chicken 'cat)        ; chicken, cat
'(cow chicken cat)          ; cow, chicken, cat
(list 'cow 'chicken 'cat)   ; cow, chicken, cat

(car '(cow chicken cat))    ; head
(cdr '(cow chicken cat))    ; tail
(cadr '(cow chicken cat))   ; second (tail, then head)
(caddr '(cow chicken cat))   ; third (tail, tail, then head)

; booleans

; empty lists and nil are false
; '(), (), 'nil, nil <- all false
; (in Clojure, nil and false are false)
(eq '() nil) ; T

; conditions

(if (= (+ 1 2) 3)
    'yes
    'no)

; use progn to execute multiple statements
(if (oddp 5)
    (progn (princ "This prints")
           'odd)
    (princ "Does not print"))

; progn can be implicit
(when (oddp 5)
      (princ "Number is odd.")
      'odd)
      
(unless (oddp 4)
        (princ "Number is even.")
        'even)

; cond allows multiple conditions with implicity progn
(defvar *arch-enemy* nil)
(defun pudding-eater (person)
    (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
                              '(curse you lisp alien - you ate my pudding))
          ((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
                               '(i hope you choked on my pudding johnny))
          (t '(why you eat my pudding stranger ?))))

; can rewrite using case
; XXX: case uses eq for comparison, so it's usually used to compare symbols
(defun pudding-eater (person)
    (case person
        ((henry) (setf *arch-enemy* 'stupid-lisp-alien)
                 '(curse you lisp alien - you ate my pudding))
        ((johnny) (setf *arch-enemy* 'useless-old-johnny)
                  '(i hope you choked on my pudding johnny))
        (otherwise '(why you eat my pudding stranger ?))))

; comparison

; use eq to compare symbols
; use equal to compare other things
(eq 'foo 'foo)          ; T
(eq '(cow) '(cow)))     ; nil
(equal '(cow) '(cow))   ; T
; eql compares symbols, numbers, and characters
(eql #\a #\a)
; equalp is like equal but with case-insensitive string comparison
(equalp "Bob Smith" "bob smith")    ; T
(equalp 0 0.0)                      ; T
; string-equal compares strings
; char-equal compars characters
; = compares numbers

; quasiquoting

; like data mode, but allows you to enter command mode
; use a backtick instead of single quote
; use a comma to enter command mode
(defun describe-path (edge)
    `(there is a ,(caddr edge) going ,(cadr edge) from here))

; mapcar

(mapcar #'sqrt '(1 2 3 4 5)) ; like the map function I'm used to
(mapcar (function sqrt) '(1 2 3 4 5)) ; the #' is shorthand for the function function

