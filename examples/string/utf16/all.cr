# string/utf16.cr: 3 examples
require "string/utf16"

# string/utf16.cr:11 (001.cr)
"hi 𐂥".to_utf16 # => Slice[104_u16, 105_u16, 32_u16, 55296_u16, 56485_u16]

# string/utf16.cr:52 (002.cr)
slice = Slice[104_u16, 105_u16, 32_u16, 55296_u16, 56485_u16]
String.from_utf16(slice) # => "hi 𐂥"

# string/utf16.cr:79 (003.cr)
slice = Slice[104_u16, 105_u16, 0_u16, 55296_u16, 56485_u16, 0_u16]
String.from_utf16(slice) # => "hi\0000𐂥"
pointer = slice.to_unsafe
string, pointer = String.from_utf16(pointer) # => "hi"
string, pointer = String.from_utf16(pointer) # => "𐂥"
