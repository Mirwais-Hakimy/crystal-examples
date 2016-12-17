# static_array.cr:236
array = StaticArray(Int32, 3).new(2)
slice = array.to_slice # => Slice[2, 2, 2]
slice[0] = 3
array # => StaticArray[3, 2, 2]
