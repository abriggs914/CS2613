import os, glob
def list2dict(lst):
    #dictionary comprehension
    return {i+1 : lst[i] for i in range(0, len(lst))}


def list2dict2(lst):
    #dictionary comprehension
    return {lst.index(elem)+1: elem for elem in lst}