# iterator.cr:788
iter = [1, 2, 3].each.select &.odd?
iter.next # => 1
iter.next # => 3
iter.next # => Iterator::Stop::INSTANCE
