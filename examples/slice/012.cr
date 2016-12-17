# slice.cr:260
slice = Slice[1, 2.5, "a"]
slice.map &.to_s # => Slice["1", "2.5", "a"]
