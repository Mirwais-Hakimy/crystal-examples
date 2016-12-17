# slice.cr:58
ptr = Pointer.malloc(9) { |i| ('a'.ord + i).to_u8 }

slice = Slice.new(ptr, 3)
slice.size # => 3
slice      # => Bytes[97, 98, 99]

String.new(slice) # => "abc"
