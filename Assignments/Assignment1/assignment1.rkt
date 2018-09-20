#lang racket
    (define (my-length lst)
      (cond
       [(empty? lst) 0]
       [else (+ 1 (my-length (rest list)))]))
     
"list length:"
    > (my-length empty)

    ;> (my-length (list "a" "b" "c"))

    (define (my-map f lst)
      (cond
       [(empty? lst) empty]
       [else (cons (f (first lst))
                   (my-map f (rest lst)))]))

     
    ;> (my-map string-upcase (list "ready" "set" "go"))
(define lst empty)

(cons -1 empty)
(cons 5 (cons -1 empty))
(cons -6(cons 5 (cons -1 empty)))

"list length:"
>(my-length lst)

(define (drop-divisible n numLst)
  (cond
    [positive? (- numLst 3) > 1]
       ((and) zero?(modulo numLst 3) "add to list"))
(cons numLst lst))
"list length:"
>(my-length lst)

>(first (lst))
