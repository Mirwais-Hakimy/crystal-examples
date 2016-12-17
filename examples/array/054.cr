# array.cr:1078
iter = [1, 2, 3].each_permutation
iter.next # => [1, 2, 3]
iter.next # => [1, 3, 2]
iter.next # => [2, 1, 3]
iter.next # => [2, 3, 1]
iter.next # => [3, 1, 2]
iter.next # => [3, 2, 1]
iter.next # => #<Iterator::Stop>
