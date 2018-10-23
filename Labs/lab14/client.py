import humansize

def approximate_size(size, a_kilobyte_is_1024_bytes=False) :
    "return human readable size, default to kilo = 1000"
    return humansize.approximate_size(size = size, a_kilobyte_is_1024_bytes = a_kilobyte_is_1024_bytes)

if __name__ == '__main__':
    print(approximate_size(1000000000000, True))
    print(approximate_size(1000000000000))