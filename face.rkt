; racket program to draw a face with eyes
; Sept 2018
; Avery Briggs
; 3471065

#lang slideshow

(define r (filled-rectangle 150 75 #:color "black"))
(define c (disk 50 #:color "green"))
(define p (filled-ellipse 400 300 #:color "orange"))
(define separator1 (rectangle 25 1))
(define separator2 (rectangle 1 35))
(define loneEye (cb-superimpose r c))
(define eyesClose (hc-append loneEye separator1 loneEye))
(define eyes (vc-append eyesClose separator2))
(define topFace (cc-superimpose p eyes))

topFace
;(draw-arrow dc 1 1 5 5 1 1)

