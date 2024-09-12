(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  (cond
    ((null? pairs) (list '() '()))
    (else   (if (null? (car pairs)) '()
              (cons (map car pairs) (zip (map cdr pairs)))))))



;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (enum_process s num)
    (cond
      ((null? s) '())
      (else  (cons (cons num (cons (car s) nil)) (enum_process (cdr s) (+ num 1))))))
  (enum_process s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  (define (merge_process list1 list2)
    (cond
      ((null? list1) list2)
      ((null? list2) list1)
      ((comp (car list1) (car list2))
       (cons (car list1) (merge_process (cdr list1) list2)))
      (else (cons (car list2) (merge_process list1 (cdr list2))))))
  (merge_process list1 list2))

  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
  (define (find_process s ans_list cur_list)
    (cond
      ((null? (cdr s)) (append ans_list (list cur_list)))
      ((< (cadr s) (car s)) (find_process (cdr s) (append ans_list (list cur_list)) (list (cadr s))))
      (else (find_process (cdr s) ans_list (append cur_list (cons (cadr s) nil))))))
  (find_process s '() (list (car s)))
  )

    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (cons form (cons params (map let-to-lambda body)))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((bindings (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (let ((vars (map car bindings))
                 (vals (map cadr bindings)))
             (cons (cons 'lambda (cons vars (map let-to-lambda body)))
                   (map let-to-lambda vals)))
           ; END PROBLEM EC
           ))
        (else
         ; BEGIN PROBLEM EC
         (map let-to-lambda expr)
         ; END PROBLEM EC
         )))
