# static_array.cr:91
array = StaticArray(Int32, 3).new 0  # => StaticArray[0, 0, 0]
array2 = StaticArray(Int32, 3).new 0 # => StaticArray[0, 0, 0]
array3 = StaticArray(Int32, 3).new 1 # => StaticArray[1, 1, 1]
array == array2                      # => true
array == array3                      # => false
