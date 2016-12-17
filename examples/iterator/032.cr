# iterator.cr:1176
iter = (1..3).each.with_index
iter.next # => {1, 0}
iter.next # => {2, 1}
iter.next # => {3, 2}
iter.next # => Iterator::Stop::INSTANCE
