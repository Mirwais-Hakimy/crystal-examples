# string.cr:3748
array = [] of Int32
"ab☃".each_codepoint do |codepoint|
  array << codepoint
end
array # => [97, 98, 9731]
