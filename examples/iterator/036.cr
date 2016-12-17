# iterator.cr:1373
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#                   ^         ^    ^
iter = ary.slice_after(&.uppercase?)
iter.next # => ['a', 'b', 'C']
iter.next # => ['d', 'E']
iter.next # => ['F']
iter.next # => ['g', 'h']
iter.next # => Iterator::Stop
