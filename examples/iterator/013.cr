# iterator.cr:474
iter = [(1..2).each, ('a'..'b').each].each.flatten
iter.next # => 1
iter.next # => 2
iter.next # => 'a'
iter.next # => 'b'
iter.next # => Iterator::Stop::INSTANCE
