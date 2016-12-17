# iterator.cr:757
iter = [2, 3, 1, 5, 4, 6].reject(3..5)
iter.next # => 2
iter.next # => 1
iter.next # => 6
iter.next # => Iterator::Stop::INSTANCE
