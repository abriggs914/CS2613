from read_csv import read_csv, header_map, select, row2dict, check_row, filter_table

def test_read_csv():
    assert read_csv('test1.csv') == [['name', 'age', 'eye colour'],
                                     ['Bob', '5', 'blue'],
                                     ['Mary', '27', 'brown'],
                                     ['Vij', '54', 'green']]

table = read_csv('test1.csv')
def test_header_map_1():
    hmap = header_map(table[0])
    assert hmap == { 'name': 0, 'age': 1, 'eye colour': 2 }

def test_select_1():
    assert select(table,{'name','eye colour'}) == [['name', 'eye colour'],
                                                   ['Bob',  'blue'],
                                                   ['Mary', 'brown'],
                                                   ['Vij',  'green']]
    #addition
    assert select(table,{'age'}) == [['age'],['5'],['27'],['54']]
    assert select(table,{}) == [[],[],[],[]]

def test_row2dict():
    hmap = header_map(table[0])
    assert row2dict(hmap, table[1]) == {'name': 'Bob', 'age': '5', 'eye colour': 'blue'}

def test_check_row():
    row = {'name': 'Bob', 'age': '5', 'eye colour': 'blue'}
    assert check_row(row, ('age', '==', 5))
    assert not check_row(row, ('eye colour', '==', 5))
    assert check_row(row, ('eye colour', '==', 'blue'))
    assert check_row(row, ('age', '>=', 4))
    assert check_row(row, ('age', '<=', 1000))

    #addition
    assert not check_row(row, ('age', '==', 1000))

    hmap = header_map(table[0])
    row2 = row2dict(hmap, table[2])
    assert check_row(row2, ('age', '==', 27))
    assert not check_row(row2, ('eye colour', '==', 5))
    assert not check_row(row2, ('eye colour', '==', 'blue'))
    assert check_row(row2, ('age', '>=', 4))
    assert check_row(row2, ('name', '==', 'Mary'))



def test_check_row_logical():
    row = {'name': 'Bob', 'age': '5', 'eye colour': 'blue'}
    assert check_row(row, (('age', '==', 5),'OR',('eye colour', '==', 5)))
    assert not check_row(row, (('age', '==', 5),'AND',('eye colour', '==', 5)))

def test_filter_table1():
    assert filter_table(table,('age', '>=', 0)) == [['name', 'age', 'eye colour'],
                                                    ['Bob', '5', 'blue'],
                                                    ['Mary', '27', 'brown'],
                                                    ['Vij', '54', 'green']]

    assert filter_table(table,('age', '<=', 27)) == [['name', 'age', 'eye colour'],
                                                     ['Bob', '5', 'blue'],
                                                     ['Mary', '27', 'brown']]

    assert filter_table(table,('eye colour', '==', 'brown')) == [['name', 'age', 'eye colour'],
                                                                 ['Mary', '27', 'brown']]

    assert filter_table(table,('name', '==', 'Vij')) == [['name', 'age', 'eye colour'],
                                                         ['Vij', '54', 'green']]

def test_filter_table2():
    assert filter_table(table,(('age', '>=', 0),'AND',('age','>=','27'))) == [['name', 'age', 'eye colour'],
                                                                              ['Mary', '27', 'brown'],
                                                                              ['Vij', '54', 'green']]


    assert filter_table(table,(('age', '<=', 27),'AND',('age','>=','27'))) == [['name', 'age', 'eye colour'],
                                                                               ['Mary', '27', 'brown']]

    assert filter_table(table,(('eye colour', '==', 'brown'),
                               'OR',
                               ('name','==','Vij'))) == [['name', 'age', 'eye colour'],
                                                        ['Mary', '27', 'brown'],
                                                        ['Vij', '54', 'green']]

    # addition
    assert filter_table(table,(('age', '<=', 10),'OR',
                                ('eye colour', '==', 'green'))) == [['name', 'age', 'eye colour'],
                                                                    ['Bob', '5', 'blue'],
                                                                    ['Vij', '54', 'green']]    
    

    assert filter_table(table,(('age', '<=', 10),'AND',
                                ('eye colour', '==', 'green'))) == [['name', 'age', 'eye colour']] 