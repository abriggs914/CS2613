#lang scribble/manual

Title: Lab23
Date: 2018-11-29T12:28:49
Tags: Lab23

	Today in lab, we continued our discussion on Octave. Our lab today was meant to be an introduction on how to start assignment 6. We saw how to manipulate arrays and how to return their values using Octave syntax. We talked about how { data([1,3,4],1) } is like a one line for loop, that can print the values of the array data, at column 1 and rows, 1, 3, and 4. We also talked briefly about cell arrays, and how they are similar to python lists. You can store more than just numbers inside a cell array, but they can be indexed the same way as a number array.

	We also had an introdution to the nearest next neighbour algorithm, which we tested using matrices and some knowledge of linear algebra. We wrote a couple of versions of the knn algorithm and the nearest algorithm, to test their individual performances. We tested the functions using vectors and a larger matrix. We wanted to know which rows are nearest to the vector.

	Our benchmark testing, showed that there are some prominent performance differences, between functions. for example the knn2 algorithm is ~10 times faster than the knn algorithm. Although we had to have some more intricate matrix manipulation, we increased our speed by a significant factor.

<!-- more -->

