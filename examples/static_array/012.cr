# static_array.cr:165
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.[]= 2 # => nil
array       # => StaticArray[2, 2, 2]
