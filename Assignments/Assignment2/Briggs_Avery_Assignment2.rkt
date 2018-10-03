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
  (string->date dateIn "~a, ~d ~b ~Y ~H:~M:~S ~z")
  (date? dateIn))


date-time-zone-offset

(define (rfc2822<? date1 date2)
  ;(define date1s (foldl (lambda (date1) (rfc2822->date date1)) date1))
  ;(define date2s (foldl (lambda (date2) (rfc2822->date date2)) date2))
  (last date1)
  (date? (first date1)))


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
(define test-dates
        '("Sun, 10 Sep 2017 09:48:44 +0200"
          "Wed, 13 Sep 2017 17:51:05 +0000"
          "Sun, 10 Sep 2017 13:16:19 +0200"
          "Tue, 17 Nov 2009 18:21:38 -0500"
          "Wed, 13 Sep 2017 10:40:47 -0700"
          "Thu, 14 Sep 2017 12:03:35 -0700"
          "Wed, 18 Nov 2009 02:22:12 -0800"
          "Sat, 09 Sep 2017 13:40:18 -0700"
          "Tue, 26 Oct 2010 15:11:06 +0200"
          "Tue, 17 Nov 2009 18:04:31 -0800"
          "Mon, 17 Oct 2011 04:15:12 +0000"
          "Sun, 16 Oct 2011 23:12:02 -0500"
          "Mon, 11 Sep 2017 14:41:12 +0100"))

#(
(module+ test
  (define test-dates
        '("Sun, 10 Sep 2017 09:48:44 +0200"
          "Wed, 13 Sep 2017 17:51:05 +0000"
          "Sun, 10 Sep 2017 13:16:19 +0200"
          "Tue, 17 Nov 2009 18:21:38 -0500"
          "Wed, 13 Sep 2017 10:40:47 -0700"
          "Thu, 14 Sep 2017 12:03:35 -0700"
          "Wed, 18 Nov 2009 02:22:12 -0800"
          "Sat, 09 Sep 2017 13:40:18 -0700"
          "Tue, 26 Oct 2010 15:11:06 +0200"
          "Tue, 17 Nov 2009 18:04:31 -0800"
          "Mon, 17 Oct 2011 04:15:12 +0000"
          "Sun, 16 Oct 2011 23:12:02 -0500"
          "Mon, 11 Sep 2017 14:41:12 +0100"))
  (define sorted-dates
          '("Tue, 17 Nov 2009 18:21:38 -0500"
           "Tue, 17 Nov 2009 18:04:31 -0800"
           "Wed, 18 Nov 2009 02:22:12 -0800"
           "Tue, 26 Oct 2010 15:11:06 +0200"
           "Sun, 16 Oct 2011 23:12:02 -0500"
           "Mon, 17 Oct 2011 04:15:12 +0000"
           "Sat, 09 Sep 2017 13:40:18 -0700"
           "Sun, 10 Sep 2017 09:48:44 +0200"
           "Sun, 10 Sep 2017 13:16:19 +0200"
           "Mon, 11 Sep 2017 14:41:12 +0100"
           "Wed, 13 Sep 2017 10:40:47 -0700"
           "Wed, 13 Sep 2017 17:51:05 +0000"
           "Thu, 14 Sep 2017 12:03:35 -0700"))
(check-equal? (sort (rfc2822<? test-dates test-dates) <) sorted-dates)))