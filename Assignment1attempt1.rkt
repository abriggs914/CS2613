#lang racket
;(circle 25)
"well that worked"
(define x (expt 9.0 10))
x
(define y (expt(expt 9 10) 2))
y
(define z(+ y 17))
z
(define a (integer-sqrt z))
a
(define b (* x a))
b
(define c (- b y))
c
(check-equal? (drop-divisible 3))
(define drop-divisible)