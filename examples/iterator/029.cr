# iterator.cr:1092
a = 0
iter = (1..3).each.tap { |x| a += x }
iter.next # => 1
a         # => 1
iter.next # => 2
a         # => 3
iter.next # => 3
a         # => 6
iter.next # => Iterator::Stop::INSTANCE
