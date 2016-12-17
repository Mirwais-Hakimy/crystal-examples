# static_array.cr:179
a = StaticArray(Int32, 3).new { |i| i + 1 } # => StaticArray[1, 2, 3]
a.shuffle!(Random.new(42))                  # => StaticArray[3, 2, 1]
a                                           # => StaticArray[3, 2, 1]
