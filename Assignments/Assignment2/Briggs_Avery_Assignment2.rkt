#lang racket
(require (only-in srfi/19 string->date [string->date dateIn]))
(require racket/date)
(require json)
(require explorer)


;; CS2613 Assignment 2
;; Oct. 5 2018
;; Avery Briggs
;; 3471065


;; I had a fair bit of trouble solving this assignment. I was unable to
;; find a way of successfully sorting the test-dates using rfc2822<?
;; However I did come really close by using the date-sorter function.
;; I just couldn't find a way to add or subtract back the timezone once I
;; sorted them. As you can see in the test module, Oct 16th transforms
;; into Oct 17th when dealing with the timezones.
;; Because I was unable to get the rfc2822<? to work properly, I found
;; implementing it in the later parts of the assignment to be tedious.
;; My sort-mail function currently can only spit back out the list of
;; test-dates after converting them to hasheq. I had the most trouble 
;; working with the hash tables and trying to pull the necessary data
;; from the json file, and put it into a table.

;; Unfortunately right now, I don't have a full enough understanding
;; of hash tables and how racket can reference their keys. This was
;; a lead contributing factor in why I was unable to complete this
;; assignment in a timely manner. My apologies for the quality.


;; Function takes in a string and converts it to
;; a date* struct string must be in a specific format.
(define (rfc2822->date dateIn)
  (string->date dateIn "~a, ~d ~b ~Y ~H:~M:~S ~z"))


;; These tests for rfc2822->date pass
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

;; Function takes in two strings representing dates.
;; Then calls rfc2822->date to convert them to date*
;; Function returns #t || #f based on whether
;; date1 < date2. Time-zones are taken into effect.
(define (rfc2822<? date1 date2)
  (define d1 (rfc2822->date date1))
  (define d2 (rfc2822->date date2))
  (define dtzo1 (- (date*->seconds d1) (date-time-zone-offset d1)))
  (define dtzo2 (- (date*->seconds d2) (date-time-zone-offset d2)))
  (< dtzo1 dtzo2)) 

;; These tests for rfc2822<? pass
(module+ test
  (check-true (rfc2822<? "Tue, 26 Oct 2010 15:11:06 +0200"  "Sun, 10 Sep 2017 13:16:19 +0200"))
  (check-false (rfc2822<? "Tue, 26 Oct 2010 15:11:06 +0200" "Tue, 26 Oct 2010 15:11:06 +0200"))
  (check-false (rfc2822<? "Sun, 10 Sep 2017 13:16:19 +0200" "Tue, 26 Oct 2010 15:11:06 +0200"))
  
  (check-true (rfc2822<? "Mon, 1 Jan 2000 00:00:00 +0200" "Mon, 1 Jan 2000 00:00:01 +0200"))
  (check-false (rfc2822<? "Sun, 10 Sep 2017 13:16:19 +0200" "Mon, 1 Jan 2000 00:00:00 +0200")))

;; Function from L06, will read a json file
(define (read-json-file file-name)
  (with-input-from-file file-name read-json))

;; Function from L06, will open an explorer window for a json file
(define (visualize-json-file file-name)
  (explore (read-json-file file-name)))

;; Function takes a list of dates and converts them to seconds
;; in order to sort them. I use the addition or subtraction of
;; (* 12 3600) for an offset in time-zone-calculation. I was
;; unable to design a better algorithm, and as such this code
;; may produce a bug when comparing two dates that are relatively
;; close together and have time-zones that cause overlaps.
;; This is apparent in the test module when comparing Oct.16 and
;; Oct.17.
(define (date-sorter dates)
  (if (eq? dates '())
      "EMPTY"
      (map (lambda (a) (seconds->date a))
           (map (lambda (x) (if 
                             (> (date-time-zone-offset (seconds->date x)) 0)
                             (- x (date-time-zone-offset (seconds->date (- x (* 12 3600)))))
                             (+ x (date-time-zone-offset (seconds->date (- x (* 12 3600)))))))
                (sort
                 (map (lambda (d) (if 
                                   (> (date-time-zone-offset (rfc2822->date d)) 0) 
                                   (+ (date*->seconds (rfc2822->date d)) (date-time-zone-offset (rfc2822->date d)))
                                   (- (date*->seconds (rfc2822->date d)) (date-time-zone-offset (rfc2822->date d)))))
                      dates)
                 <)))))

;; List of string dates in rfc2822 format
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

;; This test for sorting fails on Oct 16
;; and Oct 17. The output is two Oct 17ths
;; This bug is most likely from my sort-dates
;; function, causing loss of precision when
;; converting timezones back and forth.
(module+ test
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
  (check-equal? (map (lambda (x) (date->string x)) (date-sorter test-dates))
                (map (lambda (x) (date->string x)) (map (lambda (x) (rfc2822->date x)) sorted-dates)))
  (check-equal? (date-sorter '()) "EMPTY"))

;; Function does not work correctly. However, currently it
;; returns a list of hasheqs for the given list of dates.
(define (sort-mail . lst)
  (define (helper lst acc-hash)
    (cond
      [(empty? lst) (hash->list acc-hash)]
      [else
       (let* ([key (first lst)]
              [current (hash-ref acc-hash key 0)])
         (helper (rest lst) (hash-set acc-hash key (add1 current))))]))
  (helper lst (hash)))

;; This test for sort-mail fails, the output is not sorted
(module+ test
  (define test-hashes (map (lambda (x) (hasheq 'Date x)) test-dates))
  (define sorted-hashes (map (lambda (x) (hasheq 'Date x)) sorted-dates))
  (check-equal? (sort-mail test-hashes) sorted-hashes))

;; This function is broken. Currently just reads reads the
;; json file in order to be able to compile the program.
;; Was unable to finish this definition.
(define (summarize-mail file . flags)
  (read-json-file file))

;; This test for summarize-mail fails, I
;; was unable to figure it out in time.
(module+ test
  (check-equal?
   (sort-mail(summarize-mail "example1.json" 'Date 'From))
   '(#hasheq((Date . "Tue, 17 Nov 2009 18:21:38 -0500")
             (From . "Aron Griffis <agriffis@n01se.net>"))
     #hasheq((Date . "Tue, 17 Nov 2009 18:04:31 -0800")
             (From . "Keith Packard <keithp@keithp.com>"))
     #hasheq((Date . "Wed, 18 Nov 2009 02:22:12 -0800")
             (From . "Carl Worth <cworth@cworth.org>"))))
  (check-equal?
   (take (list-tail (sort-mail (summarize-mail "example2.json" 'Date 'Subject 'From)) 2) 3)
   '(#hasheq((Subject
              .
              "Processed: Re: general: can't stop daemon using /etc/init.d/foo stop when disabled via /etc/default/foo")
             (Date . "Mon, 17 Oct 2011 04:15:12 +0000")
             (From . "owner@bugs.debian.org (Debian Bug Tracking System)"))
     #hasheq((Subject
              .
              "Bug#601455: Steps towards a patch to document disabling a daemon upon installation")
             (Date . "Sat, 09 Sep 2017 13:40:18 -0700")
             (From . "Sean Whitton <spwhitton@spwhitton.name>"))
     #hasheq((Subject
              .
              "Bug#601455: Steps towards a patch to document disabling a daemon upon installation")
             (Date . "Sun, 10 Sep 2017 09:48:44 +0200")
             (From . "md@Linux.IT (Marco d'Itri)")))))
