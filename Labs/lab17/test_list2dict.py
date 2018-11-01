#!/usr/bin/python3

from list2dict import list2dict, list2dict2

def test_empty():
    assert list2dict([]) == {}

def test_abc():
    dictionary=list2dict(["a", "b", "c"])
    assert dictionary == {1: 'a', 2: 'b', 3: 'c'}

def test_empty_2():
    assert list2dict2([]) == {}

def test_abc_2():
    dictionary=list2dict2(["a", "b", "c"])
    assert dictionary == {1: 'a', 2: 'b', 3: 'c'}