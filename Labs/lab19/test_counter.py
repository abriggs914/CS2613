from counter import make_counter2, make_counter
def test_count():
    counter1=make_counter(100)
    counter2=make_counter2(100)

    for j in range(0,100):
        assert next(counter1) == counter2()