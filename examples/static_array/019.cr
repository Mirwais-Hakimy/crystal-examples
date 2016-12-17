# static_array.cr:258
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.to_s # => "StaticArray[1, 2, 3]"
