# iterator.cr:350
iter = ["a", "b", "c"].each.cycle
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => "a"
# and so an and so on
