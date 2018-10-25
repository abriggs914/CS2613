#lang racket

(define (list->hash2 lst acc-hash n)
   (define (helper lst acc-hash n)
        (cond
          [(empty? lst) acc-hash]
          [else
           (let* ([key (first lst)])
             (helper (rest lst) (hash-set acc-hash n key) (add1 n)))]))
  (helper lst acc-hash n))

(define abc (list "a" "b" "c"))
(define abclong (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l"))
(define hash-table (list->hash2 abclong (hash) 10))
(define hash-table3 (list->hash2 abc (hash) 1))
;hash-table3

(module+ test
  (require rackunit)
  ;(define abc (list "a" "b" "c"))
  ;(define hash-table (list->hash abc (hash) 1))
  (check-equal? (hash-ref hash-table3 1) "a")
  (check-equal? (hash-ref hash-table3 2) "b")
  (check-equal? (hash-ref hash-table3 3) "c"))