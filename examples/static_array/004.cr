# static_array.cr:42
ary = StaticArray[1, 'a']
ary[0]    # => 1
ary[1]    # => 'a'
ary.class # => StaticArray(Char | Int32, 2)
