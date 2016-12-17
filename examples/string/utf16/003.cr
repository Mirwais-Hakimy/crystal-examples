# string/utf16.cr:79
require "string/utf16"
slice = Slice[104_u16, 105_u16, 0_u16, 55296_u16, 56485_u16, 0_u16]
String.from_utf16(slice) # => "hi\0000𐂥"
pointer = slice.to_unsafe
string, pointer = String.from_utf16(pointer) # => "hi"
string, pointer = String.from_utf16(pointer) # => "𐂥"
