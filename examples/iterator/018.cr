# iterator.cr:729
iter = [1, 2, 3].each.reject &.odd?
iter.next # => 2
iter.next # => Iterator::Stop::INSTANCE
