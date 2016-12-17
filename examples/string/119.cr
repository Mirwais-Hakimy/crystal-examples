# string.cr:3718
array = [] of Tuple(Char, Int32)
"ab☃".each_char_with_index do |char, index|
  array << {char, index}
end
array # => [{'a', 0}, {'b', 1}, {'☃', 2}]
