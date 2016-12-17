# static_array.cr:9
StaticArray(Int32, 3).new(42)           # => StaticArray[42, 42, 42]
StaticArray(Int32, 3).new { |i| i * 2 } # => StaticArray[0, 2, 4]
StaticArray[0, 8, 15]                   # => StaticArray[0, 8, 15]
