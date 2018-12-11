#lang racket

(define (binmap func lst1 lst2)
  (cond
    [(empty? lst1) lst2]
    [(empty? lst2) lst1]
    [(append (cons (func (first lst1) (first lst2)) '())  (binmap func (rest lst1) (rest lst2)))]))

(module+ test
  (require rackunit)

  (check-equal? (binmap + '(1 2 3) '(4 5 6)) '(5 7 9))
  (check-equal? (binmap * '(1 2 3) '(4 5 6)) '(4 10 18))

  (check-equal? (binmap string-append '("hello" "world ")
                                      '(" mom" "travel"))
        '("hello mom" "world travel"))

  (check-equal? (binmap + '(1 2 3) '(4 5 6 7)) '(5 7 9))
  (check-equal? (binmap + '(1 2 3 4) '(4 5 6)) '(5 7 9)))