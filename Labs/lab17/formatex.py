import os,glob

strings_plus = []
for p in glob.glob("*.py"):
    size=os.stat(p).st_size
    strings_plus.append(p + "\t" + str(size))

strings_format = ["{f:s}\t{s:d}".format(f=file, s=os.stat(file).st_size) for file in glob.glob("*.py")]

#this version formats based on the position of the values
strings_format2 = ["{0:s}\t{1:d}".format(file, os.stat(file).st_size) for file in glob.glob("*.py")]

# print(strings_plus)
# print(strings_format)
# print(strings_format2)