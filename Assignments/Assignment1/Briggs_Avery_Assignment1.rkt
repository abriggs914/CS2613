#lang racket

;; CS2613 Assignment 1
;; Sept. 21 2018
;; Avery Briggs
;; 3471065

;; Function drop-divisible takes 2 arguments.
;; i - a divisor
;; lst - a list of numbers
;; Returns a list of numbers non-trivially divisible
;; by the divisor (don't enter 0 or 1).
(define (drop-divisible i lst)
  (if (empty? lst)
      empty
      (if (or (< (first lst) (+ i 1)) (not (equal? (modulo (first lst) i) 0)))
          (cons (first lst) (drop-divisible i (rest lst)))
          (drop-divisible i (rest lst)))))

;; Test for drop-divisible
(module+ test
  (require rackunit)
  (check-equal? (drop-divisible 3 (list 2 3 4 5 6 7 8 9 10)) (list 2 3 4 5 7 8 10))
  (check-equal? (drop-divisible 3 '(5 9 14 11 12 13 24 36 5 6 9 36 10 11)) '(5 14 11 13 5 10 11)))

;; Function sieve-with takes 2 arguments.
;; div - a list of divisors
;; lst - a list of numbers
;; Returns a list of numbers non-trivially divisible
;; by any of the divisors (don't enter 0 or 1).
(define (sieve-with div lst)
  (foldl (lambda (div lst) (drop-divisible div lst)) lst div))

;; Test for sieve-with
(module+ test
  (check-equal? (sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10)) (list 2 3 5 7))
  (check-equal? (sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10)) '(2 3 5 7)))

;; Function sieve takes 1 argument.
;; n - a number
;; Returns a list of all prime numbers up to and 
;; including n (don't enter 0 or 1).
(define (sieve n)
  (define lst (range 2 (+ n 1) 1))
  (define result (range 2 (+ 1 (sqrt n)) 1))
  (sieve-with result lst))

;; Test for sieve
(module+ test
  (check-equal? (sieve 10) (list 2 3 5 7))
  (check-equal? (sieve 21) (list 2 3 5 7 11 13 17 19))
  (check-equal? (sieve 100) '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)))

;; I wasn't exactly sure how you wanted the (prime?) function implented.
;; It seems to return a t/f whereas the (sieve) function returns a list
;; of the primes up to a given n.
(module+ test
  (require math/number-theory)
  (check-equal? (last (sieve 99991)) 99991) ; largest prime up to 100000.
  (prime? 99991) ; 99991 is prime
  (check-equal? (last (sieve 10)) 7) ; gives 7 which is the largest prime up to 10.
  (prime? 7)) ; 7 is prime

