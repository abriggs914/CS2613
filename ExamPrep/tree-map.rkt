#lang racket
(define ls '())
;;(define (tree-map func lst)
;;  (cond
;;    [(empty? lst) lst]
;;    [(and (not (empty? (rest lst))) (list? (first (rest lst)))) (tree-map func (rest lst))]
;;    [else (map func lst)]))

(define (tree-map func lst)
  (cond
    [(empty? lst) lst]
    [(and (not (empty? (rest lst))) (not (list? (first (rest lst))))) (map func lst)]
    [(and (not (empty? (rest lst))) (list? (first (rest lst)))) (tree-map func (rest lst))]))

;;(tree-map add1 '())
;;(tree-map add1 '(1 2 3))
;;(tree-map (lambda (x) (* x x)) '(1 2 3))
(set! ls '(1 (2 3)))
(first (rest ls))
(tree-map sub1 '(1 (2 3)))
(module+ test
  (require rackunit)
  (check-equal? (tree-map add1 '()) '())
  (check-equal? (tree-map add1 '(1 2 3)) '(2 3 4))
  (check-equal? (tree-map (lambda (x) (* x x)) '(1 2 3)) '(1 4 9))
  (check-equal? (tree-map sub1 '(1 (2 3))) '(0 (1 2)))          ;; fail
  (check-equal? (tree-map (lambda (x) (modulo x 2))             ;; fail
                          '((1 2) (3 4) 5 (6 (7))))                                                   
                '((1 0) (1 0) 1 (0 (1))))
  (check-equal? (tree-map (lambda (x)
                            (string-append "I wanna " x))
                          '("pony" ("xbox" "A+")))
                '("I wanna pony" ("I wanna xbox" "I wanna A+"))))
