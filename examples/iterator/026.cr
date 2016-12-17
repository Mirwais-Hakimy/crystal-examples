# iterator.cr:983
iter = (1..6).each.step(2)
iter.next # => 1
iter.next # => 3
iter.next # => 5
iter.next # => Iterator::Stop::INSTANCE
