# string.cr:186
ptr = Pointer.malloc(5) { |i| i == 4 ? 0_u8 : ('a'.ord + i).to_u8 }
String.new(ptr) # => "abcd"
