#lang racket/base

(define (my-+ a b)
  (if (zero? a)
      b
      (my-+ (sub1 a) (add1 b))))

;(define (my-* a b)
;  (if (zero? a)
;      b
;      (my-* (sub1 a) (my-+ b b))))

;(define (my-* a b)
;  (cond
;    [(zero? a) 0]
;    [else (my-+ (my-* (sub1 a) b) b)]))

(define (my-* a b)
  (cond
    [(equal? a 1) b]
    [(zero? a) 0]
    [else
     (my-+(my-* (sub1 a) b) b)]))

(provide my-+
         my-*)
(module+ test
  (require rackunit)
  
(check-equal? (my-+ 1 1) 2 "Simple addition")
(check-equal? (my-* 1 2) 2 "Simple multiplication")  
(check-equal? (my-* 0 2) 0 "Simple multiplication")  
(check-equal? (my-* 3 2) 6 "Simple multiplication"))