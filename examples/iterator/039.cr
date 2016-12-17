# iterator.cr:1515
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#              ^         ^    ^
iter = ary.slice_before('A'..'Z')
iter.next # => ['a', 'b']
iter.next # => ['C', 'd']
iter.next # => ['E']
iter.next # => ['F', 'g', 'h']
iter.next # => Iterator::Stop
