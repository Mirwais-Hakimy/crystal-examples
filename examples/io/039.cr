# io.cr:1077
File.write("testfile", "hello")

file = File.new("testfile")
file.pos     # => 0
file.gets(2) # => "he"
file.pos     # => 2
