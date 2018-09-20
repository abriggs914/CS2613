#lang scribble/manual

Title: Lab5
Date: 2018-09-20T12:53:21
Tags: Lab5

	Today the lab was promarily focused on built-in higher-order functions in Dr Racket. We talked about traversing lists using foldl and foldr. We also worked on implementing and debugging for loops in racket. The implementation of the loops is syntactically very much different than that of java. The core functionality is the same however, due to the new syntax, I struggled with debugging one of the lab questions.

	We talked about the complexity of certain segments of code and how the decision to implement it with recursion or iteratively. Since Dr Racket will attempt process an infinte without thinking too much about it, playing around with the loop bounds, deemed to be a difficult task. The point of the exercise was to compare how accurately we could approximate an integral or a derivative. Since I had trouble adjusting the range, some of my tests weren't as useful or informative as I would have wanted.

	While on the topic of recursion, we briefly reviewed how the stack works and how stack frames are created. In racket, the stack works differently, where it can decide whether or not it needs to keep a newly created stack frame. This is useful when we are recursivly computing something, if we aren't changing the stack frame, we can save memory by choosing not to store the data in the stack.

<!-- more -->

