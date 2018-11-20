#lang scribble/manual

Title: Lab20
Date: 2018-11-20T11:07:21
Tags: Lab 20

	Today was our last lab on python. We continued to talk about generators and built-in python functions like __next__ and __iter__. We used these functions to start some basic object oriented programming with python. It seems very similar to that of javaScript. We created a simple expression interpreter class to evaluate some mathematical expressions. Then adding on to that example, we had nested Expr objects stored as expressions, which would create a layer of recursion within the eval method.

	We also recreated our fibonacci generator program using classes. We then ran tests comparing their outputs, to ensure that they had the same functionality. We did this four our counter program as well. Personally I prefer using classes and objects over functions as return values, like generators are meant to be used. Learning all of the "special" built-in function names seems to be important, because while bug-fixing the expr.py program, there was a confusing point where __eq__ was envoked, but there was no explicit function call in the code. I don't quite understand where the call came from in this example, I'm pretty sure it is used as a check for object equivalence.

	I am almost sad to be moving on from python. I have found it to be very pleasant for coding, and error checking is intuitive and miles better than javaScript. It would be nice to have more time to learn more about the built-in functions and what you can do with them. Python seems to be a powerful language, and I feel I have just scraped the surface.

<!-- more -->

