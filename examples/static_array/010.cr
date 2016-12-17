# static_array.cr:142
array = StaticArray(Int32, 3).new { |i| i + 1 } # => StaticArray[1, 2, 3]
array.update(1) { |x| x * 2 }                   # => 4
array                                           # => StaticArray[1, 4, 3]
# array.update(5) { |x| x * 2 }                   # raises IndexError
