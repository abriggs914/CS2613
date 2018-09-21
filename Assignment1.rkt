#lang racket

(define (drop-divisible i lst)
  (if (empty? lst)
      empty
      (if (or (< (first lst) (+ i 1)) (not (equal? (modulo (first lst) i) 0)))
          (cons (first lst) (drop-divisible i (rest lst)))
      (drop-divisible i (rest lst)))))

(module+ test
  (require rackunit)
  (check-equal? (drop-divisible 3 (list 2 3 4 5 6 7 8 9 10)) (list 2 3 4 5 7 8 10)))

(drop-divisible 3 '(5 9 14 11 12 13 24 36 5 6 9 36 10 11))

(map (lambda (number) (+ 1 number)) '(1 2 3 4))

;(define (sieve-with div lst)
;  (map (lambda (div)(drop-divisible div (sort (remove-duplicates (flatten (map (lambda (div)
;         (drop-divisible div lst))
;      div))) <))) div))

;(define (sieve-with div lst)
;  (sort (remove-duplicates (flatten (map (lambda (div)
;         (drop-divisible div (drop-divisible div lst)))
;      (rest div)))) <))

(define (keep-duplicates lst)
  (foldr (lambda (x y) (cons x (filter (lambda (z) (not (= x z))) y))) empty lst))

;(define (sieve-with div lst)
;  (foldr (lambda (x y) (cons x (filter (lambda (z) (not (= x z))) y))) empty lst))

(define (elements xs)
  (set->list (list->set xs)))

(define (duplicates xs)
  (elements
   (for/fold ([xs xs]) ([u (elements xs)])
     (remove u xs))))

(define (uniques xs)
  (remove* (duplicates xs) xs))

(define (remove-non-duplicates xs)
  (remove* (uniques xs) xs))

(define (list-length list)
  (if (empty? list)
      0
      (+ 1 (list-length (rest list)))))

(define (element-count lst c t)
  (cond
    [(empty? lst) 0]
    [(= (first lst) t) (+ 1 (element-count (rest list) c t))]))

;(define (sieve-with div lst)
;  (define c (list-length lst))
;         (sort (flatten (map (lambda (div) (drop-divisible div lst))
;              div)) <))

(foldl (lambda (a b result) (* result (- a b))) 1 '(1 2 3) '(4 5 6))

(define (r div lst)
  (foldl cons div lst))

(define (sieve-with div lst)
  (sort
   (foldl (lambda (div lst) (drop-divisible div lst))
          lst div) <))

;(define (sieve-with div lst)
;  (define result list)
;  (for/div ([i div])
;    ([(not (empty? div))]))
;  (foldl (lambda (div) (cons (drop-divisible div lst) empty)) div))

;(define (sieve-with div lst)
;  (define c lst)
;         (remove-duplicates (remove-non-duplicates (sort (flatten (map (lambda (div) (drop-divisible div c))
;              div)) <))))

(sieve-with '(2 3) (list 15 16))
(sieve-with '(2 3 5) (list 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16))
(sieve-with '(2 3 5 7) '(1 2 3 4 5 6 7 8 9 10 14 20 21))
(module+ test
  (check-equal? (sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10)) (list 2 3 5 7)))
foldl
(module+ test
  (check-equal? (sieve-with '(2 3 5) (list 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16)) (list 2 3 5 7 11 13)))

(foldr (lambda (v l) (cons (add1 v) l)) '() '(1 2 3 4))

(define (sieve n)
  (define result (range 2 (+ n 1) 1))
  (define result2 (range 2 (+ n 1) 1))
  (sieve-with result result))
  ;(foldl (lambda (result result2) (sieve-with result result2)) result2 result))
 ;(for/list ([i 1]) ([(append (sieve-with 'n (range i n 1)) result)]) (if (>= i n) (+ 1 i))
 ;  ))

(module+ test
  (check-equal? (sieve 10) (list 2 3 5 7)))


"hey there"
(sieve-with '(2 3 4 5 6 7 8 9 10) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2 3 4 5 6 7 8 9) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2 3 4 5 6 7 8) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2 3 4 5 6 7) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2 3 4 5 6) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2 3 4 5) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2 3 4) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10))
(sieve-with '(2) (list 2 3 4 5 6 7 8 9 10))
