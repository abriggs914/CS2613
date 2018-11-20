#!/usr/bin/python3
class Fib:
    def __init__(self,max):
        self.max = max
        # self.a = 0
        # self.b = 1
        self.__iter__()

    def __next__(self):
        if self.a < self.max:
            #print(self.a)
            tmp = self.a 
            self.a = self.b
            self.b = tmp+self.b
            return tmp
        else:
            raise StopIteration

    def __iter__(self):
        self.a = 0
        self.b = 1
        return self

if __name__ == '__main__':
    fibber = Fib(100)
    for n in fibber:
        print(n)
    for n in fibber:
        print(n)
    