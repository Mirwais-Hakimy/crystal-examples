# indexable.cr:61
ary = ['a', 'b', 'c']
ary[0]  # => 'a'
ary[2]  # => 'c'
ary[-1] # => 'c'
ary[-2] # => 'b'

# ary[3]  # raises IndexError
# ary[-4] # raises IndexError
