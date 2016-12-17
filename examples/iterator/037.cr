# iterator.cr:1401
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#                   ^         ^    ^
iter = ary.slice_after('A'..'Z')
iter.next # => ['a', 'b', 'C']
iter.next # => ['d', 'E']
iter.next # => ['F']
iter.next # => ['g', 'h']
iter.next # => Iterator::Stop
