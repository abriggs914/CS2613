def fibgen(max):
    a, b = 0, 1
    while a < max:
        yield a
        tmp = a 
        a = b
        b = tmp+b
        #a, b = b, a + b

def fibgen2(max):
    a,b = 0,1
    def next():
        nonlocal a,b
        # print('Hey a: ',a,', b: ',b) # printing strings and nums together
        if a < max:
            old = a
            a, b = b, a + b
            return old

            # a, b = b, a + b
            # return b-a

        else:
            return None
    return next

def fib3(max):
    a, b = 0, 1
    while a < max:
        yield a
        temp = a
        a = b
        b = temp + b
