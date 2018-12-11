from ArithSeq import ArithSeq

def test_evens():
    assert [ x for x in ArithSeq(0,2,10) ] == [0,2,4,6,8,10]

def test_odds():
    assert [ x for x in ArithSeq(1,2,10) ] == [1,3,5,7,9]


def test_No_Interval():
    assert [ x for x in ArithSeq(10,-10,10) ] == []

# Testing the possibility of the interval being too small (returns null list)

def test_Negative_Interval():
    assert [ x for x in ArithSeq(20, 10, -2) ] == [20,18,16,14,12,10]

# Testing the possibility of the interval being negative (returns descending list)