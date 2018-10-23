#no exception handling
def fraction(a,b):
    if(b == 0):
        return 'NaN'
    else:
        return a/b

#with exception handling
def fraction2(a,b):
    try:
        return a/b
    except ZeroDivisionError:
        return 'NaN'