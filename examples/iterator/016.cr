# iterator.cr:642
iter = (1..3).each.in_groups_of(2, 'z')
iter.next # => [1, 2]
iter.next # => [3, 'z']
iter.next # => Iterator::Stop::INSTANCE
