#lang racket
(define (binmap2 op list1 list2)
  (define (helper lst1 lst2 acc) 
    (cond
      [(empty? lst1) lst2]
      [(empty? lst2) lst1]
      [(append acc (op (first lst1) (first lst2)))(binmap2 op (rest lst1) (rest lst2))]))
  (reverse (helper list1 list2 '())))

(module+ test
  (require rackunit)

  (check-equal? (binmap2 + '(1 2 3) '(4 5 6)) '(5 7 9))
  (check-equal? (binmap2 * '(1 2 3) '(4 5 6)) '(4 10 18))

  (check-equal? (binmap2 string-append '("hello" "world ")
                                      '(" mom" "travel"))
        '("hello mom" "world travel"))

  (check-equal? (binmap2 + '(1 2 3) '(4 5 6 7)) '(5 7 9))
  (check-equal? (binmap2 + '(1 2 3 4) '(4 5 6)) '(5 7 9)))