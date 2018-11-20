import csv

def read_csv(filename):
    #"""Read a CSV file, return list of rows"""
    with open(filename, newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter='\n', quotechar='|')
        for row in spamreader:
            print(', '.join(row))
    return spamreader

table = read_csv('test1.csv')
def test_header_map_1():
    hmap = header_map(table[0])
    assert hmap == { 'name': 0, 'age': 1, 'eye colour': 2 }
