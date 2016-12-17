# string/utf16.cr:52
require "string/utf16"
slice = Slice[104_u16, 105_u16, 32_u16, 55296_u16, 56485_u16]
String.from_utf16(slice) # => "hi 𐂥"
