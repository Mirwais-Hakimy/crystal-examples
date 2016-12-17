# slice.cr:20
slice = Slice[1, 'a']
slice[0]    # => 1
slice[1]    # => 'a'
slice.class # => Slice(Char | Int32)
