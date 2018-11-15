def make_counter(x):
    print('entering make_counter')
    while True:
        yield x # yield is like leaving, but coming back to where you left off
        print('incrementing x')
        x = x + 1

if __name__ == "__main__":
    print('first')
    counter = make_counter(100)
    print('second')
    print(next(counter))
    print('third')
    print(next(counter))
    print(next(counter))
    print('last')

def make_counter2(x):
    count = x
    def counter():
        nonlocal count
        if count == x:
            print('entering counter')
        else:
            print('incrementing counter')
        count = count + 1
        return count - 1
    return counter

if __name__ == "__main__":
    print('first')
    counter = make_counter2(100)
    print('second')
    print(next(counter))
    print('third')
    print(next(counter))
    print(next(counter))
    print('last')