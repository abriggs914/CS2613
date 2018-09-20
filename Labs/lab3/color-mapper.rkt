#lang slideshow
(define (rainbow p)
   (map(lambda (color)
   (colorize p color))
     (list "red" "orange" "yellow" "blue")))

(define (color-mapper p color-list)
   (cond
     [(empty? color-list) empty]
     [else (cons (colorize p (first color-list))
           (color-mapper p (rest color-list)))]))



