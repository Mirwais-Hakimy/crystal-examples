# static_array.cr:224
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.reverse! # => StaticArray[3, 2, 1]
