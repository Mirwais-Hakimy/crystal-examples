# slice.cr:296
src = Slice['a', 'a', 'a']
dst = Slice['b', 'b', 'b', 'b', 'b']
src.copy_to dst
dst             # => Slice['a', 'a', 'a', 'b', 'b']
# dst.copy_to src # raises IndexError
