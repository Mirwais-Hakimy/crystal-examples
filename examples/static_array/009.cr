# static_array.cr:126
array = StaticArray(Int32, 3).new { |i| i + 1 } # => StaticArray[1, 2, 3]
array[2] = 2                                    # => 2
array                                           # => StaticArray[1, 2, 2]
# array[4] = 4                                    # raises IndexError
