;#lang racket
#lang slideshow
(display "Hello World\n")
(define c (circle 10))
(define r (rectangle 50 50))
(define (square n)
  ; A semi-colon starts a line comment.
  ; The expression below is the function body.
  (filled-rectangle n n))
(define s (square 100))
s
>(filled-ellipse 100 50)

> 5
5
> "art gallery"
"art gallery"

(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

>"hey there"
> (checker (colorize (square 10) "red")(colorize (square 10) "black"))

>(hc-append r c r)
>(cc-superimpose(rectangle 250 150)(circle 25)(rectangle 50 50))

(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

(four s)


