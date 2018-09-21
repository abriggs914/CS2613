#lang slideshow
> 5 ;prints 5

> "art gallery" ; prints "art gallery"

> (circle 10)   ; prints circle diameter 10 pixels

> (rectangle 10 20)  ; prints rectangle 10x20

> (hc-append (circle 10) (rectangle 10 20)) ; prints circle appended to rectangle at centre

(define c (circle 10)) ; circle c

(define r (rectangle 10 200)) ; rectangle r
r  ; prints r

> (hc-append c r) ; prints circle c appended to rectangle r at centre

> (hc-append 20 c r c) ; prints circle c appended to rectangle r at centre with width 20

(define (square n)
  ; A semi-colon starts a line comment.
  ; The expression below is the function body.
  (filled-rectangle n n))  ; square object, takes parameters 
> (square 10)

(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p)) ; function definition of four. takes in a shape and a size to
                           ;group four of those shapes together.
 
> (four (circle 10))
(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

 
> (checker (colorize (square 10) "red")
           (colorize (square 10) "black"))
(define (checkerboard p)
  (let* ([rp (colorize p "red")]
         [bp (colorize p "black")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))

 
> (checkerboard (square 10)) ; creates a checkerboard of squares
> (checkerboard (circle 20))

(define (series mk)
  (hc-append 4 (mk 5) (mk 10) (mk 20)))  ; definition for series drawing

 
> (series circle) ; prints a series of circles calling the series definition.
> (series square) ; prints a series of squares calling the series definition.
> (series (lambda (size) (checkerboard (square size)))) ; prints a series of checkerboards

(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))

 
> (rgb-series circle)

> (rgb-series square)

(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue"))))

 
> (series (rgb-maker circle))

> (series (rgb-maker square))

> (list "red" "green" "blue") ; prints out colour names

> (list (circle 10) (square 10)) ; creates a list of a circle and a square object

(define (rainbow p) ; rainbow function to take in a shape and a size to print a 
  (map (lambda (color) ; list of shapes of the pre-determined colours of sizeIn
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple"))) 

 
> (rainbow (square 5)) ; prints a horizontal list of rainbow squares of size 5 pixels

> (apply vc-append (rainbow (square 5))) ; prints a verticle list of rainbow colours

(require pict/flash)

> (filled-flash 40 30) ; prints comic window filled in black