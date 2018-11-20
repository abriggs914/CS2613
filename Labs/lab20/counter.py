class Counter:
    "Simulation of generator using only __next__ and __init__"
    def __init__(self,x): # constructors start with __init__
        self.x = x        # __x__ underlines mean special functions
        self.first = x

    def __next__(self):
        if self.x == self.first:
            print("Entering make counter")
        else:
            print('Incrementing x')


        self.x = self.x + 1
        return self.x - 1

print('first')
counter = Counter(100)
print('second')
print(next(counter))
print('third')
print(next(counter))
print('last')