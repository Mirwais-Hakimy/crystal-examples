# iterator.cr:636
iter = (1..3).each.in_groups_of(2)
iter.next # => [1, 2]
iter.next # => [3, nil]
iter.next # => Iterator::Stop::INSTANCE
