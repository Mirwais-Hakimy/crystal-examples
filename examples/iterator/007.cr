# iterator.cr:259
iter = [1, nil, 2, nil].each.compact_map { |e| e.try &.*(2) }
iter.next # => 2
iter.next # => 4
iter.next # => Iterator::Stop::INSTANCE
