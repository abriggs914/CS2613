#lang racket
(require (only-in srfi/19 string->date [string->date dateIn]))


;; CS2613 Assignment 2
;; Oct. 5 2018
;; Avery Briggs
;; 3471065

(struct date (second
              minute
              hour
              day
              month
              year
              week-day
              year-day
              dst?
              time-zone-offset)
  #:extra-constructor-name make-date
  #:transparent)

(define (rfc2822->date dateIn)
  (string->date dateIn "~a, ~d ~b ~Y ~H:~M:~S ~z"))

date-time-zone-offset
(define (rfc2822<? dateIn)
  "Hey there")


(string->date "Tue, 26 Oct 2010 15:11:06 +0200" "~a, ~d ~b ~Y ~H:~M:~S ~z")
(string->date "Mon, 1 Jan 2000 00:01:00 +0000" "~a, ~d ~b ~Y ~H:~M:~S ~z")

(module+ test
  (require rackunit)
  (check-equal? (rfc2822->date "Tue, 26 Oct 2010 15:11:06 +0200")
                (date* 6 11 15 26 10 2010 2 298 #f 7200 0 ""))
  (check-equal? (rfc2822->date "Sat, 09 Sep 2017 13:40:18 -0700")
                (date* 18 40 13 9 9 2017 6 251 #f -25200 0 ""))
  (check-equal? (rfc2822->date "Mon, 1 Jan 2000 00:00:00 +0000")
                (date* 0 0 0 1 1 2000 6 0 #f 0 0 ""))
  (check-equal? (rfc2822->date "Sun, 10 Sep 2017 13:16:19 +0200")
                (date* 19 16 13 10 9 2017 0 252 #f 7200 0 "")))

     
#(
(module+ test
  (check-true (rfc2822<? "Tue, 26 Oct 2010 15:11:06 +0200"  "Sun, 10 Sep 2017 13:16:19 +0200"))
  (check-false (rfc2822<? "Tue, 26 Oct 2010 15:11:06 +0200" "Tue, 26 Oct 2010 15:11:06 +0200"))
  (check-false (rfc2822<? "Sun, 10 Sep 2017 13:16:19 +0200" "Tue, 26 Oct 2010 15:11:06 +0200")))
)