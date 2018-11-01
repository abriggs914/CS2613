#!/usr/bin/python3

from math import sqrt,ceil
import glob, os

def drop_divisible(n,lst):
    return [j for j in lst if j == n or j % n != 0]

def sieve_with(candidates, lst):
    for c in candidates:
        lst=drop_divisible(c,lst)
    return lst

def sieve(n):
    return sieve_with(range(2,ceil(sqrt(n))+1), range(2,n))

#print(drop_divisible(3, [2, 3, 4, 5, 6, 7, 8, 9, 10]))