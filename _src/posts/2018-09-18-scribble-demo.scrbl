#lang scribble/manual

Title: Scribble Demo
Date: 2018-09-18T12:18:59
Tags: Lab4

    This blog post was to practice mixing scrbl files in frog with racket commands.
This will allow us to make adjustments directly on the blog page. We created a hello function
will greet a person with their name.

@(string-append "hello " "world")
@(define (hello) "hello")
@(define (greet person)
   (string-append (hello) " " person))

@greet{Cookie Monster}

@(greet "Big Bird")

@(define (todo hdr . lst)
   (list (bold hdr)
         (apply itemlist
                (map item lst))))

@todo["Shopping" "cheese" "fish" "shuriken"]
<!-- more -->

