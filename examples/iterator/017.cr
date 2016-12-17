# iterator.cr:702
iter = [1, 2, 3].each.map &.*(2)
iter.next # => 2
iter.next # => 4
iter.next # => 6
iter.next # => Iterator::Stop::INSTANCE
