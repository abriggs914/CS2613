#lang racket
;; CS2613 midterm exam q2
;; Oct. 25 2018
;; Avery Briggs
;; 3471065

(define (tr-length lst)
  (define (helper lst acc)
    (cond
      [(null? lst) acc] ;; base case
      [(helper (rest lst) (add1 acc))])) ;; recursive call.
  (helper lst 0))

(define abc (list "a" "b" "c"))
(define abclong (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l"))

;; this test achieves full coverage
(module+ test
  (require rackunit)
  (check-equal? (tr-length abc) 3)
  (check-equal? (tr-length abclong) 12))
