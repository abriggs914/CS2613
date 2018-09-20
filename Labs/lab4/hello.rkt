#lang racket
(define (hello) (displayln "Hello world!"))
(module+ test
  (require rackunit).
  (check-equal? (with-output-to-string hello) "Hello world!\n"))

(module cake racket
  (provide print-cake)
 
  (define (print-cake n)
    (show "   ~a   " n #\.)
    (show " .-~a-. " n #\|)
    (show " | ~a | " n #\space)
    (show "---~a---" n #\-))
 
  (define (show fmt n ch)
    (printf fmt (make-string n ch))
    (newline)))

> (require 'cake)
> (print-cake 3)