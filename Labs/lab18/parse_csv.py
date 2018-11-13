import re

def split_csv1(string):
    #return split(string)
    ret_line = []
    for str in string.splitlines():
        ret_line.append(str.split(','))
    return ret_line

def split_csv2(str):
    return [line.split(',') for line in str.splitlines()]

def split_csv3(str):
    return [split_row_3(line) for line in str.splitlines()]

def split_csv4(str):
    return [split_row(line) for line in str.splitlines()]

def strip_quotes(string):
        strip_regex = re.compile('"?([^"]*)"?')
        # strip_regex = re.compile(r'''
        # "? #optional
        # ( # start group
        # [^"]* # any number of non-quote characters
        # ) # end group
        # "? #optional
        # ''', re.VERBOSE)
        search = strip_regex.search(string)
        if search:
            return search.group(1)
        else:
            return None

def split_row_3(string):
        split_regex=re.compile(
            r'''^   # start
            (
                "[^"]*" #quoted
                | [^,]* #unquoted
            ) #column
            ,("[^"]*" | [^,]*) #column
            ,("[^"]*" | [^,]*) #column
            $''', re.VERBOSE)
        search = split_regex.search(string)
        if search:
            return [ strip_quotes(col) for col in search.groups() ]
        else:
            return None

def split_row(str):
        col_regex=re.compile(
            r'''   # start
            (
                "[^"]*" #quoted
                | [^,]+ #unquoted
            ) #column
            ''', re.VERBOSE)
        search = col_regex.search(str)
        if search:
            return [ strip_quotes(col) for col in \
                     col_regex.findall(str)]
        else:
            return None