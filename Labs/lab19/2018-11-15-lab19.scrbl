#lang scribble/manual

Title: Lab19
Date: 2018-11-15T12:32:26
Tags: Lab19

	Our lab today was a continuation of python. We were introduced to generators, yield, and nonLocal. These keywords provide non-typical functionality compared to some other languages. Being able to process something at the same time as another piece of code is quite useful. I have just been introduced to the same kind functionality in c, to simulate pthreads running asyncronously with the main code. Python seems to improve on the design by adding the yield keyword. If a function can stop execution, but be able to resume where it left off, we can implement this to save code and space, rather than introducing countless variables to save the relevant data.

	We worked on converting our sieve assignment in racket to have a generator in drop_divisible. This was to show the similarity between generators and list comprehensions. The generator version, for me just appears simpler. The way most list conversion instructions are coded, they mostly appear cluttered and tracing them takes longer than the generator instruction lines.

	Running comparisons and timed tests for both versions, we were able to see the major time and space differences for each method. The generator version is significantly faster, because it runs much less overhead on the os by switching back and forth between methods and recalculating data points.

<!-- more -->

