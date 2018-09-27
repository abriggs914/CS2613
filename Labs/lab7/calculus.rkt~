#lang racket
(require racket/math)
(provide -2pi 2pi deriv)

(module+ test
  (require rackunit)
  (define epsilon .001))

(define dx 0.001)
(define -2pi (* -2 pi))
(define 2pi (* 2 pi))

;; compute the derivative of `f' at the given point `x'
(define (deriv f x)
  (/ (- (f (+ x dx)) (f x)) dx))

;; Integrate a function from 0 to x (using tail recursion)
(define (integrate f x)
  (define (loop y acc)
    (if (> y x)
        (* acc dx)
        (loop (+ y dx) (+ acc (f y)))))
  (loop 0 0))

(module+ test
  (check-= (integrate cos (/ pi 4)) (sin (/ pi 4)) epsilon))

(module+ test
  (define test-points (build-list 20 (lambda (x) (* 2 pi (random)))))
  (define (sin2 x) (integrate cos x))
  (define (cos2 x) (deriv sin x))
  (for ([x test-points])
    (check-= (* (sin x) 10) (*(* (sin2 x) dx)10000) epsilon)
    (check-= (cos x) (cos2 x ) epsilon)))

(define (integrate2 f x)
  (for/fold
   ([acc 0])
   ([y (in-range 0 x dx)])
    (+ acc (f y))))

(module+ test
  (for ([x test-points])
    (check-= (* (integrate cos x) 1000) (integrate2 cos x) epsilon)))

(define (factorial n)
  (for/fold
  ([val 1])
  ([x (in-range 1 (add1 n) 1)])
  (* x val)))