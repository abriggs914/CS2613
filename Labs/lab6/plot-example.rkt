#lang racket
(require "calculus.rkt")
(require plot)

(plot (list
       (function sin -2pi 2pi)
       (function (lambda (x) (deriv sin x)))))
#(
; my first attempt
(plot (list
       (function sin -2pi 2pi)
       (function (lambda (x) (- cos x (function (deriv sin x)))))))
)

(define (diff x)
  (- (cos x) (deriv sin x)))

(plot 
 (function diff -2pi 2pi)
 #:y-min -0.1
 #:x-max 0.1)