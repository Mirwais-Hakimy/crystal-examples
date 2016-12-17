# string.cr:225
str = String.new(4) do |buffer|
  buffer[0] = 'a'.ord.to_u8
  buffer[1] = 'b'.ord.to_u8
  {2, 2}
end
str # => "ab"
