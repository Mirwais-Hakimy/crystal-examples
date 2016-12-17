# iterator.cr:862
iter = (1..3).each.skip(2)
iter.next # -> 3
iter.next # -> Iterator::Stop::INSTANCE
