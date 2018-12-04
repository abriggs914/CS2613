#lang scribble/manual

Title: Lab24
Date: 2018-12-04T12:24:14
Tags: Lab24

	In our lab today we got to practice some more with octave and matrices. For our examples we processed images using linear algebra methods to alter the image with certain contrasts and filters. It is done by multiplying the RGB values of each element by ratios, and re-rendering the picture. This is a pretty cool application for all the work we have been doing on processing arrays. It seems like the task of image processing can take time, as well. We had a smple picture of only about 1 Mb, but depending on how many times the elements were accessed, it varied on how long it took to re-render the image.

	I had some trouble figuring out how the reshaping function works though. Thinking of the arrays as stacks of LEGO blocks was definitly a good visual aid. So far it seems like Octave is a language that specializes in arrays and lists of data. The built-in functions are very minimalist in their namings, and are often cumbersome to look up in the documentation. Of the languages we have used so far, I would have to say that Octave has the most confusing, and hard to find, documentation.


<!-- more -->

