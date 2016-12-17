# iterator.cr:1017
iter = ["a", "b", "c"].each.first 2
iter.next # => "a"
iter.next # => "b"
iter.next # => Iterator::Stop::INSTANCE
