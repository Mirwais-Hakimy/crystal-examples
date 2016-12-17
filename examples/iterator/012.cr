# iterator.cr:451
iter = (1..9).each.each_slice(3)
iter.next # => [1, 2, 3]
iter.next # => [4, 5, 6]
iter.next # => [7, 8, 9]
iter.next # => Iterator::Stop::INSTANCE
