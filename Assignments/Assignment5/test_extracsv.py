from read_csv import read_csv, header_map, select, row2dict, check_row, filter_table

table = read_csv('2013-100.csv')
hmap = header_map(table[0])
# print(hmap)
print(table[1])

# def test_row2dict():
#     assert table