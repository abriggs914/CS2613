#lang scribble/manual

Title: Lab13
Date: 2018-10-18T13:15:08
Tags: Lab 13

	Today we worked more with js objects. We continued our files from lab 12, converting the older type class definitions using protoype functions, to ES2015 standard using the class operator.
From there we implemented several logic functions to simulate a critter moving around the map. Using the ES2015 classes made this task simpler by letting us use less code, and built in this operator. 

	We also talked about asynchronous program execution, and why the all done! statement would print before our timer was finished. This reminded me of how threads execute inside the CPU. If we don't wait for the process to execute, or at least tell a dependent process to wait, then our outputs can be random and unpredictable.

	We combined our modified files for life.js and world.js to create a short animation of the simulation. We can see the 'o' critters moving around and turning when they encounter an obstacle.
We compared a few versions of internal counters to determine which one would work best for our objective. This involved clearing the current screen as well as printing an updated version within the given time interval, which we could lengthen or shorten to make the animation look more smooth.

<!-- more -->

