# static_array.cr:192
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.map! { |x| x*x } # => StaticArray[1, 4, 9]
