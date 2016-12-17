# slice.cr:187
slice = Slice.new(5) { |i| i + 10 }
slice # => Slice[10, 11, 12, 13, 14]

slice2 = slice[1, 3]
slice2 # => Slice[11, 12, 13]
