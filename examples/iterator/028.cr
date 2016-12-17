# iterator.cr:1054
iter = (1..5).each.take_while { |i| i < 3 }
iter.next # => 1
iter.next # => 2
iter.next # => Iterator::Stop::INSTANCE
