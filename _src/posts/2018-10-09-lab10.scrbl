#lang scribble/manual

Title: lab10
Date: 2018-10-09T13:00:37
Tags: lab10

    Today was our first lab back after the long weekend. We continued to work with javascript and jasmine tests. We picked up our discussion on '===' and '==', from last week and we worked on a custom equals function. This was a tricky question, requiring us to check multiple conditions to determine that, even if we were compairing objects, all properties of the objects are equal in some way. This is similar to searching a hashtable and checking matching elements. My first attempt at the problem was iterative, and failed tests between objects. I think it was due to the order of how it checks elements. The recursive implementation is significantly nicer than my iterative one.

	Today, we also were introduced to arrays in javascript. They seem to be more versatile in this language than others that I have worked with. The push() function allows us to add elements to the array as many times as we like, and the size of the array will adjust. I think this will prove to be easier to work with, when needing to resize an array. We used push() to create lists of numbers over a given range and increment value. We simply declared an empty array and pushed each item on, one at a time, iteratively. We didn't have worry about the indexing bounds, which I think is a fantastic improvement over say java or c. 

<!-- more -->

