# array.cr:936
ary = [1, 6, 2, 4, 8]
ary.reject!(3..7)
ary # => [1, 2, 8]
