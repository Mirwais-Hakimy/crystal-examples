# iterator.cr:741
iter = [1, false, 3, true].each.reject(Bool)
iter.next # => 1
iter.next # => 3
iter.next # => Iterator::Stop::INSTANCE
