# static_array.cr:108
array = StaticArray(Int32, 3).new 0 # => StaticArray[0, 0, 0]
array == nil                        # => false
