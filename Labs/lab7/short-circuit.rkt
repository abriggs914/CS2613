#lang racket
(define-syntax-rule (And a b)
      (if b a #f))

(module+ test
      (require rackunit)
      (define (die)
        (error 'die "don't run this"))
      
      (check-equal? (And (die) #f) #f)
      (check-exn exn:fail? (lambda () (and (die) #f))))

(module+ test
  (define-syntax-rule (check-fail expr)
    (check-exn exn:fail? (lambda () expr)))
  (check-fail (and (die) #f))
  (check-fail (And #f (die))))

(define-syntax-rule (Or a b)
  (if (and (not b) (not a)) #f #t))

(define-syntax-rule (Or2 a b)
  (if (not b) a #t))

(define-syntax-rule (Or3 a b)
  (if b #t a))

(module+ test
  (check-equal? (Or #t #t) #t)
  (check-equal? (Or #f #t) #t)
  (check-equal? (Or #t #f) #t)
  (check-equal? (Or (die) #t) #t)
  (check-fail (or (die) #t)))

(module+ test
  (check-equal? (Or2 #t #t) #t)
  (check-equal? (Or2 #f #t) #t)
  (check-equal? (Or2 #t #f) #t)
  (check-equal? (Or2 (die) #t) #t)
  (check-fail (or (die) #t)))

(module+ test
  (check-equal? (Or3 #t #t) #t)
  (check-equal? (Or3 #f #t) #t)
  (check-equal? (Or3 #t #f) #t)
  (check-equal? (Or3 (die) #t) #t)
  (check-fail (or (die) #t)))

(define-syntax-rule (If t a b)
  (or (and (not t) b) (and t a)))

(module+ test
  (require rackunit)
  (check-equal? (If #t "foo" "bar") "foo")
  (check-equal? (If #f "foo" "bar") "bar"))


