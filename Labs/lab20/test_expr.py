from expr import Expr
from copy import deepcopy

six_plus_nine = Expr('+', 6, 9)
six_times_nine = Expr('*', 6, 9)
compound1 =  Expr('+', six_times_nine, six_plus_nine)
compound2 =  Expr('*', six_times_nine, compound1)
compound3 =  Expr('+', compound2, 3)

def test_equality():
    assert six_plus_nine == deepcopy(six_plus_nine)
    assert compound1 == deepcopy(compound1)
    assert compound2 == deepcopy(compound2)
    assert compound3 == deepcopy(compound3)

def test_basic():
    x = six_plus_nine
    y = six_times_nine
    assert six_plus_nine.eval() == 15
    assert six_times_nine.eval() == 54
    assert x == six_plus_nine
    assert y == six_times_nine

def test_recur():
    x = compound1
    y = compound2
    z = compound3
    assert compound1.eval() == 69
    assert compound2.eval() == 3726
    assert compound3.eval() == 3729
    assert x == compound1
    assert y == compound2
    assert z == compound3
