# iterator.cr:1608
ary = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21]
iter = ary.slice_when { |i, j| i + 1 != j }
iter.next # => [1, 2]
iter.next # => [4]
iter.next # => [9, 10, 11, 12]
iter.next # => [15, 16]
iter.next # => [19, 20, 21]
iter.next # => Iterator::Stop
