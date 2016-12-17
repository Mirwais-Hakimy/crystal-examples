# string.cr:3794
array = [] of UInt8
"ab☃".each_byte do |byte|
  array << byte
end
array # => [97, 98, 226, 152, 131]
