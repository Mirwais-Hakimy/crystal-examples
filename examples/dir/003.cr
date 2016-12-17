# dir.cr:114
d = Dir.new("testdir")
array = [] of String
while file = d.read
  array << file
end
array.sort # => [".", "..", "config.h"]
