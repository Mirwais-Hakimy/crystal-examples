# iterator.cr:1487
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#              ^         ^    ^
iter = ary.slice_before(&.uppercase?)
iter.next # => ['a', 'b']
iter.next # => ['C', 'd']
iter.next # => ['E']
iter.next # => ['F', 'g', 'h']
iter.next # => Iterator::Stop
