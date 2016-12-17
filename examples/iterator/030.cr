# iterator.cr:1124
iter = [1, 2, 1].each.uniq
iter.next # => 1
iter.next # => 2
iter.next # => Iterator::Stop::INSTANCE
