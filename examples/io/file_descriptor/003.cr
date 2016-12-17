# io/file_descriptor.cr:123
require "io/file_descriptor"
File.write("testfile", "hello")

file = File.new("testfile")
file.pos = 3
file.gets_to_end # => "lo"
