import csv

val = 0

class classthing:
    def __init__(self, name):
        self.name = name

def read_csv(filename):
    #"""Read a CSV file, return list of rows"""
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

table = read_csv('test1.csv')
print(table)

def header_map(row):
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

hmap = header_map(table[0])
print(hmap)

def select(table, dct):
    lst = []
    for row in table:
        for item in dct:
            print(row)
            print(item)
            # header_map(row)
            for obj in row:
                if obj == item:
                    lst.append(item)
    print(lst)
    return lst
print("\n\n\n")
print(select(table,{'name','eye colour'}))
