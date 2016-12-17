# array.cr:469
a = ["a", "b", "c", "d", "e"]
a[-3, 3] # => ["c", "d", "e"]
# a[6, 1]  # raise IndexError
a[1, 2]  # => ["b", "c"]
a[5, 1]  # => []
