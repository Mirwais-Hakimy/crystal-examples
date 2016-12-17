# string.cr:201
ptr = Pointer.malloc(4) { |i| ('a'.ord + i).to_u8 }
String.new(ptr, 2) # => "ab"
