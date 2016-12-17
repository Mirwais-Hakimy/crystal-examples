# static_array.cr:203
array = StaticArray[1, 2.5, "a"]
array.map &.to_s # => StaticArray["1", "2.5", "a"]
