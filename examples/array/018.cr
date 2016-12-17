# array.cr:311
ary = [1, 2, 3]
ary[0] = 5
p ary # => [5,2,3]

# ary[3] = 5 # raises IndexError
