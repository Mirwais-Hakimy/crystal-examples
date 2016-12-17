# iterator.cr:556
iter = [1, 2, 3].each.flat_map { |x| [x, x] }

iter.next # => 1
iter.next # => 1
iter.next # => 2

iter = [1, 2, 3].each.flat_map { |x| [x, x].each }

iter.to_a # => [1, 1, 2, 2, 3, 3]
