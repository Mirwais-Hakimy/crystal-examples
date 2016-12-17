# iterator.cr:814
iter = [1, 3, 2, 5, 4, 6].select(3..5)
iter.next # => 3
iter.next # => 5
iter.next # => 4
iter.next # => Iterator::Stop::INSTANCE
