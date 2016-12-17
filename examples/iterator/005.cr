# iterator.cr:167
iter = (1..2).each.chain(('a'..'b').each)
iter.next # => 1
iter.next # => 2
iter.next # => 'a'
iter.next # => 'b'
iter.next # => Iterator::Stop::INSTANCE
