# indexable.cr:81
ary = ['a', 'b', 'c']
ary[0]?  # => 'a'
ary[2]?  # => 'c'
ary[-1]? # => 'c'
ary[-2]? # => 'b'

ary[3]?  # nil
ary[-4]? # nil
