# iterator.cr:387
iter = ["a", "b", "c"].each.cycle(2)
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => Iterator::Stop::INSTANCE
