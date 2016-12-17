# iterator.cr:288
iter = (1..5).each.cons(3)
iter.next # => [1, 2, 3]
iter.next # => [2, 3, 4]
iter.next # => [3, 4, 5]
iter.next # => Iterator::Stop::INSTANCE
