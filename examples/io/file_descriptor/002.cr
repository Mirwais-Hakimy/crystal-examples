# io/file_descriptor.cr:107
require "io/file_descriptor"
File.write("testfile", "hello")

file = File.new("testfile")
file.pos     # => 0
file.gets(2) # => "he"
file.pos     # => 2
