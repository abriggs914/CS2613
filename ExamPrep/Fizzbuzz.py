class FizzBuzz:
    def __init__(self, max=100):
        self.n=1; self.max=max

    def __next__(self):
        a = self.n
        self.n = a + 1
        if a < self.max:
            if a % 3 == 0 and a % 5 == 0:
                return 'FizzBuzz'
            elif a % 3 == 0:
                return 'Fizz'
            elif a % 5 == 0:
                return 'Buzz'
            else:
                return a

    def __iter__(self):
        return self

fb=FizzBuzz(15)
print(list(fb))
