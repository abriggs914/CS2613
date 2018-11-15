import timeit
import sieve
import sievegen

n = 2
for j in range(0,16):
    n = n+n
    code1 = "sieve.sieve({num:d})".format(num=n)
    code2 = "[x for x in sievegen.sieve({num:d})]".format(num=n)
    print("n={num:d}, sieve={time:f} gen={time2:f}".format( 
    num = n,
    time = timeit.timeit(code1,"import sieve", number = 100),
    time2 = timeit.timeit(code2,"import sievegen", number = 100)))