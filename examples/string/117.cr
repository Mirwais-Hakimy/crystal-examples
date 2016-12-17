# string.cr:3685
array = [] of Char
"ab☃".each_char do |char|
  array << char
end
array # => ['a', 'b', '☃']
