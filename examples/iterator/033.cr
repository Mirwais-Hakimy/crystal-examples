# iterator.cr:1218
iter = (1..3).each.with_object("a")
iter.next # => {1, "a"}
iter.next # => {2, "a"}
iter.next # => {3, "a"}
iter.next # => Iterator::Stop::INSTANCE
