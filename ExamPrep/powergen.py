def powergen(n):
    i = 0
    while n > 0:
        yield n**i
        i += 1