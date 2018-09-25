#lang racket
(module+ test
  (require rackunit))

(define (odds-evens lst)
  (cond
    [(empty? lst) (list 0 0)]
    [(odd? (first lst)) (map + '(1 0) (odds-evens (rest lst)))]
    [(even? (first lst)) (map + '(0 1) (odds-evens (rest lst)))]))

(module+ test
  (check-equal? (odds-evens (list 3 2 1 1 2 3 4 5 5 6)) (list 6 4)))

(define (odds-evens2 lst)
  (define (helper lst odds evens)
    (cond
      [(empty? lst) (list odds evens)]
      [(odd? (first lst)) (helper (rest lst) (+ odds 1) evens)]
      [(even? (first lst)) (helper (rest lst) odds (+ evens 1))]))
  (helper lst 0 0))

(module+ test
  (define random-list (build-list 100 (lambda (x) (random 1 100))))
  (check-equal? (odds-evens2 (list 3 2 1 1 2 3 4 5 5 6)) (list 6 4))
  (check-equal? (odds-evens random-list) (odds-evens2 random-list)))

(define (odds-evens3 lst)
  (define-values (odds evens)
    (for/fold
     ([odds 0] [evens 0])
     ([n lst])
      (cond
        [(odd? n) (values (add1 odds)  evens)]
        [(even? n) (values odds (add1 evens))])))
  (list odds evens))

(module+ test
  (check-equal? (odds-evens3 (list 3 2 1 1 2 3 4 5 5 6)) (list 6 4))
  (check-equal? (odds-evens random-list) (odds-evens3 random-list)))

(define big-list (build-list 1000000 identity))
(for* ([fun (list odds-evens odds-evens2 odds-evens3)]
       [rep '(1 2 3)])
  (display fun)
  (displayln rep)
  (time (fun big-list)))
