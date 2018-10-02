#lang scribble/manual

Title: Lab7
Date: 2018-09-27T13:13:10
Tags: Lab7

	Today was our last lab on the racket programming language. We worked on more higher-order functions and more syntax within the language. The topics for today were about defining syntax rules for simple boolean logic operations like or and and. We have already been exposed to the concept of short-circuit evaluation for a condition in other languages. It is a pretty cool function that allows a condition to be read and evaluated in a certain order. You can write conditional statements that will be preemptively be ignored because of the order that you tried to evaluate all conditions. I.e. you can check (x != 0 && (3 / x) > 1), this won't ever let the 3/x function be evaluated when x == 0;

	We also talked about the difference between a let and let* statement. They are very useful within function definitions in racket. They allow you to define a variable on the fly and use it in the scope of that function. Although the syntax is a bit complex and "full" for my taste, I can appreciate the power of using them to help process a function.

	Personally I am happy to be moving away from the racket language, and into javascript. I felt that I was becomming comfortable with the language, but as we progress in the course, new and more complex functions and syntaxes are being introduced, quickly. It is difficult to grasp the syntax for these functions, where the language is being introduced so fast, but I have learned alot by watching Dr. Bremner's examples and through various youtube tutorials. 

<!-- more -->

