#!/usr/bin/python3
class FizzBuzz:
    def __init__(self, max):
        self.n=1; self.max=max
        self.__iter__()

    def __next__(self):
        a = self.n
        self.n = a + 1
        if a <= self.max:
            if a % 3 == 0 and a % 5 == 0:
                return 'FizzBuzz'
            elif a % 3 == 0:
                return 'Fizz'
            elif a % 5 == 0:
                return 'Buzz'
            else:
                return a
        else:
            raise StopIteration

    def __iter__(self):
        self.n = 1
        # self.max = 100
        return self

fb=FizzBuzz(15)
print(list(fb))
