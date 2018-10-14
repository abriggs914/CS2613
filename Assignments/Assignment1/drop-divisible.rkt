#lang racket

;(define (drop-divisible i list)
;  map((if positive? (/ list 3))(else 0) list))
(define r 10)
(define s 20)
;s
(define lst (list 0 1 2))
;(quotient s r)
;(quotient (first lst) r)
;s

(define (drop-divisible2 i lst)
  (cond
    [(empty? lst)]
    [else
     (cond
       [zero? (modulo (first lst) i) 0]
       [else (cons (first lst))])])
  (cond
    [empty? (rest lst)]
    [else (drop-divisible2 i (rest lst))]))

(define (drop-divisible1 i lst)
  (cond
    [(empty? lst)]
    [else
     (cond
       [zero? (modulo (first lst) i) 0]
       [else (cons (first lst))])])
  (cond
    [empty? (rest lst)]
    [else (drop-divisible1 i (rest lst))]))

(define (square x)(expt x 2))

(define (drop-divisible i lst)
  (if (empty? lst)
      empty
      (if (or (< (first lst) 4) (not (equal? (modulo(first lst) i) 0)))
          (cons (first lst) (drop-divisible i (rest lst)))
      (drop-divisible i (rest lst)))))
  ;(cond
  ;  [(zero? (/ list i))]
  ;  [else (cons (drop-divisible i (first (rest list))) empty)]))

(module+ test
  (require rackunit)
  (check-equal? (drop-divisible 3 (list 2 3 4 5 6 7 8 9 10)) (list 2 3 4 5 7 8 10)))
(drop-divisible1 3 '(2 3 4 5 6 7 8 9 10))
(drop-divisible 3 '(2 3 4 5 6 7 8 9 10))
;(squarer '(1 2 3 4 5))