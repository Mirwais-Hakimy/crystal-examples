# slice.cr:162
slice = Slice.new(5) { |i| i + 10 }
slice[0] = 20
slice[-1] = 30
slice # => Slice[20, 11, 12, 13, 30]

# slice[10] = 1 # raises IndexError
