# slice.cr:142
slice = Slice.new(5) { |i| i + 10 }
slice # => Slice[10, 11, 12, 13, 14]

slice2 = slice + 2
slice2 # => Slice[12, 13, 14]
