# iterator.cr:897
iter = [1, 2, 3, 4, 0].each.skip_while { |i| i < 3 }
iter.next # => 3
iter.next # => 4
iter.next # => 0
iter.next # => Iterator::Stop::INSTANCE
