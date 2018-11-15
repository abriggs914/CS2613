from fibonacci import fib, fib2, fib3
def test_fib1():
    fun = fib2(1000)
    lst2 = []
    while True:
        n = fun()
        if n!=None:
            lst2.append(n)
        else:
            break
    assert lst2 == list(fib(1000))

def test_fib2():
    fun = fib2(1000)
    lst2 = []
    while True:
        n = fun()
        if n!=None:
            lst2.append(n)
        else:
            break
    assert lst2 == list(fib3(1000))