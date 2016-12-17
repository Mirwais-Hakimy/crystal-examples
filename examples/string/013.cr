# string.cr:164
slice = Slice.new(2, 0_u8)
slice[0] = 186_u8
slice[1] = 195_u8
String.new(slice, "GB2312") # => "好"
