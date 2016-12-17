# file.cr:692
File.write("foobar", "foo\nbar")

array = [] of String
File.each_line("foobar") do |line|
  array << line
end
array # => ["foo", "bar"]
