# static_array.cr:155
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.size # => 3
