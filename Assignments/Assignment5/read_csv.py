#   CS2613 Assignment 5
#   Nov.23/18
#   Avery Briggs
#   3471065
#
#   Python program to process csv files
#   using similar commands as for a database.

import csv

def read_csv(filename):
    """Read a CSV file, return list of rows"""
    lst = []
    with open(filename) as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        for row in reader:
            '\', \''.join(row)
            lst_row = []
            for item in row:
                item = item.lstrip()
                lst_row.append(item)
            lst.append(lst_row)
    return list(lst)

    # TESTS
# table = read_csv('test1.csv')
# print("Table\t", table)

def header_map(row):
    """read in a row and return a dictionary of headers"""
    lst = []
    dct = {}
    colNum  = 0
    for item in row:
        item = item.lstrip()
        lst.append(item)
    for item in lst:
    	dct[item] = colNum
    	colNum = colNum + 1
    return dct

    # TESTS
# hmap = header_map(table[0])
# print("hmap\t",hmap)

def select(table, dct):
    """Recieve parsed csv table and header dict, return list of columns matching header""" 
    lst = []
    oplst = []
    for attr in header_map(table[0]):
        if attr in dct:
            oplst.append(header_map(table[0])[attr])
    for row in table:
        lst_row = []
        hmap = header_map(row)
        for header in row:
            if hmap[header] in oplst:
                lst_row.append(header)
        lst.append(lst_row)
    return lst

#     TESTS
# print('select\t',select(table,{'name','eye colour'}))

def row2dict(hmap, row):
    """take a header map dict and row, return dict of the row"""
    dct = dict(zip(sorted(hmap, key = hmap.__getitem__),row))
    return dct

    # TESTS
# print('row2dict\t',row2dict(hmap, table[1]))

def check_row(row, query):
    """take in row and tuple query, return True/False if row matches query"""
    left = query[0]
    op = query[1]
    right = query[2]
    res = False
    if left in row:
        left = row[left]
    if right in row:
        right = row[right]
    if type(left) == tuple or type(right) == tuple:
        if type(left) != type(right):
            return False
    elif op != '==':
        left = int(left)
        right = int(right)
    else:
        left = str(left)
        right = str(right)
    if op == '==':
        res = left == right
    elif op == '<=':
        res = left <= right
    elif op == 'AND':
        res = check_row(row,left) and check_row(row,right)
    elif op == 'OR':
        res = check_row(row,left) or check_row(row,right)
    else:
        res = left >= right
    return res

#     TESTS
# row = {'name': 'Bob', 'age': '5', 'eye colour': 'blue'}
# print(check_row(row, ('age', '==', 5)))
# print(check_row(row, ('eye colour', '==', 5)))
# print(check_row(row, ('eye colour', '==', 'blue')))
# print(check_row(row, ('age', '>=', 4)))
# print(check_row(row, ('age', '<=', 1000)))
# print(check_row(row, (('age', '==', 5),'OR',('eye colour', '==', 5))))
# print(check_row(row, (('age', '==', 5),'AND',('eye colour', '==', 5))))

def filter_table(table,query):
    """take in parsed csv table and query, return list of rows intable that match query"""
    lst = []
    hmap = header_map(table[0])
    for row in table:
        if row != table[0]:
            if check_row(row2dict(hmap,row), query):
                lst.append(row)            
        else:
            lst.append(row)
    return lst
    
#   TESTS
# print(filter_table(table,('age', '>=', 0)),'\n')
# print(filter_table(table,('age', '<=', 27)),'\n')
# print(filter_table(table,('eye colour', '==', 'brown')))

# print(filter_table(table,(('age', '>=', 0),'AND',('age','>=','27'))),'\n')
# print(filter_table(table,(('age', '<=', 27),'AND',('age','>=','27'))),'\n')
# print(filter_table(table,(('eye colour', '==', 'brown'),
#                                'OR',
#                                ('name','==','Vij'))),'\n')
