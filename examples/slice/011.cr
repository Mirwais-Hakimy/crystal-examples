# slice.cr:246
slice = Slice[1, 2, 3]
slice.map! { |x| x * x }
slice # => Slice[1, 4, 9]
