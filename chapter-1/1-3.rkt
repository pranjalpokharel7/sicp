#lang sicp

(define (square x) (* x x))

(define (sum-of-square a b) (+ (square a) (square b)))

(define (sos-largest-two x y z)
  (cond((< x y) (cond
                  ((< x z) (sum-of-square y z))
                  (else (sum-of-square y x))))
       ((> x y) (cond
                  ((< y z) (sum-of-square x z))
                  (else (sum-of-square x y))))
       (else (sum-of-square x z))))

(sos-largest-two -1 2 3)