# string.cr:150
slice = Slice.new(4) { |i| ('a'.ord + i).to_u8 }
String.new(slice) # => "abcd"
