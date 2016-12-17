# slice.cr:333
src = Slice['a', 'a', 'a']
dst = Slice['b', 'b', 'b', 'b', 'b']
src.move_to dst
dst             # => Slice['a', 'a', 'a', 'b', 'b']
# dst.move_to src # raises IndexError
