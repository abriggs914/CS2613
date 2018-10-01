#lang racket
(require "calculus.rkt")
(require plot)

(lambda (x) (- (deriv sin x) (cos x)))

(define (fsub f g)
  (lambda (x) (- (f x) (g x))))
  
  (module+ test
    (require rackunit)
    (define (sin2 x) (integrate cos x))
    (define (cos2 x) (deriv sin x))
    (define epsilon 0.001)
    (define test-points (build-list 20 (lambda (x) (* 2 pi (random)))))
    (for ([x test-points])
      (check-= ((fsub cos cos2) x) 0 epsilon)
      (check-= ((fsub sin sin2) x) 0 epsilon)))

(plot (function (fsub (lambda (x) (deriv sin x)) cos) -2pi 2pi))

(define (fderiv f)
  (lambda (x) (deriv f x)))

(plot (function (fsub (fderiv sin) cos) -2pi 2pi))

(define (binop->fbinop op)
  (lambda (f g)
    (lambda (x) (op (f x) (g x)))))

(define fsub2 (binop->fbinop -))

(plot (function (fsub2 (fderiv sin) cos) -2pi 2pi))

(define fadd (binop->fbinop +))
(plot (function (fadd  sin cos) -2pi 2pi))

(define (mogrify g f)
  (lambda (x) (g f x)))

(define (fderiv2 f) (mogrify deriv f))

(plot (function (fsub (fderiv2 sin) cos) -2pi 2pi))

(define (currify g)
  (lambda (f) (lambda (x) (g f x))))

(define fderiv3 (currify deriv))
(module+ test
      (for ([x test-points])
        (check-= (cos x) ((fderiv3 sin) x) epsilon)))