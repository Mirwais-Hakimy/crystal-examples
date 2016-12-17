# slice.cr:99
slice = Slice.new(3) { |i| i + 10 }
slice # => Slice[10, 11, 12]
