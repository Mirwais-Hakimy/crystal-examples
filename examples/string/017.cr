# string.cr:260
str = String.build do |str|
  str << "hello "
  str << 1
end
str # => "hello 1"
