# iterator.cr:209
array_of_iters = [[1], [2, 3], [4, 5, 6]]
iter = Iterator(Int32).chain array_of_iters
iter.next # => 1
iter.next # => 2
iter.next # => 3
iter.next # => 4
