# iterator.cr:1138
iter = [["a", "a"], ["b", "a"], ["a", "c"]].each.uniq &.first
iter.next # => ["a", "a"]
iter.next # => ["b", "a"]
iter.next # => Iterator::Stop::INSTANCE
