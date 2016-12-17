# string/utf16.cr:11
require "string/utf16"
"hi 𐂥".to_utf16 # => Slice[104_u16, 105_u16, 32_u16, 55296_u16, 56485_u16]
