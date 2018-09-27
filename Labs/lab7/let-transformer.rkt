#lang racket
(provide let-transformer)
(define (let-transformer lst)
  (match lst
    [(list 'Let* '() body) body]
    [(list 'Let* (cons (list id val) tail) body)
     (list 'let  (list (list id val))
           (let-transformer
            (list 'Let* tail body)))]))

(module+ test
  (require rackunit)
  (check-equal? (let-transformer '(Let* ([x 5]
                                         [y (- x 3)])
                                        (+ y y)))
                '(let ([x 5]) (let ([y (- x 3)]) (+ y y)))))

(define (swapper lst)
  (match lst
  ['() '()]
  [(cons (list a b) tail)
   (cons (list b a) (swapper tail))]))


(module+ test
  (check-equal? (swapper '((1 2) (3 4) (5 6))) '((2 1) (4 3) (6 5))))

#(
(define-syntax (Let^ stx)
      (syntax-case stx ()
        [(Let^ () body) #'body]
        [(Let^ ((first-id first-val) (id val) ...) body)
         #'(let ([first-id first-val])
             (Let^ [(id val) ...] body))]))



(require (for-syntax racket/match))
(require (for-syntax "let-transformer.rkt"))

(define-syntax (Let* stx)
      (datum->syntax #'here (let-transformer (syntax->datum stx))))

    (module+ test
      (require rackunit)
      (check-equal? (Let^ ([x 5] [y (- x 3)]) (+ y y)) 4)
      (check-equal? (Let^ ([x 5] [y (- x 3)] [y x]) (* y y)) 25))
)
