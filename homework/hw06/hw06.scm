(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cdr (cdr s)))
)


(define (sign num)
  (cond
    ((> num 0) 1)
    ((= num 0) 0)
    (else -1))
)


(define (square x) (* x x))

(define (pow x y)
  (cond
    ((= y 1) x)
    ((even? y) (pow (square x) (/ y 2)))
    (else (* x (pow (square x) (quotient y 2))))
    )
  )


