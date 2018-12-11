# I believe this class is implemented properly, but when I run the tests, it
# seems to enter a loop and report no tests.

class ArithSeq:
    def __init__(self, start, step, max):
        self.start = start
        self.step = step
        self.max = max
        self.__iter__()

    def __next__(self):
        a = self.start
        b = self.max
        c = self.step
        res = []
        for i in (range(a,b,c)):
            return res.append(i)

    def __iter__(self):
        return self