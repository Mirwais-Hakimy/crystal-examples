# iterator.cr:801
iter = [1, false, 3, nil].each.select(Int32)
iter.next # => 1
iter.next # => 3
iter.next # => Iterator::Stop::INSTANCE
