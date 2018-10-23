from divisive import fraction
from divisive import fraction2

def test_fraction_int():
    assert fraction(4,2) == 2

def test_fraction_NaN():
    assert fraction(4,0) == 'NaN'

def test_fraction2_int():
    assert fraction2(4,2) == 2

def test_fraction2_NaN():
    assert fraction2(4,0) == 'NaN'