#lang scribble/manual

Title: Lab25
Date: 2018-12-06T12:25:13
Tags: Lab 25

	Today was our last lab in this course. We wrapped up Octav with some more image processing like we started in lab 24. We continued to use some of the files we created last lab to modify an image, and determine the highest contrast points of the image. It is kind of cool to understand what a camera does to apply a filter or modify a picture. Since they can be represented by simple matrices, Octave is very good at manipulating them. 
	
	We then attempted to take an image and determine its outline using the contrast values of the neighbouring pixels. We used a special matrix called the Soebel-Feldman operator, which allows us to modify an image using a ratio between an images gradient and its contrast. We can think of a gradient change in an image as a new line or a border, because they typically don't match their neighbours. 

	I am glad that I had the opportunity to work with octave, it allowed me to visualize and play around with concepts I was introduced to in linear algebra, in an environment that is comfortable.

<!-- more -->

