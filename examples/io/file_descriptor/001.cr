# io/file_descriptor.cr:70
require "io/file_descriptor"
File.write("testfile", "abc")

file = File.new("testfile")
file.gets(3) # => "abc"
file.seek(1, IO::Seek::Set)
file.gets(2) # => "bc"
file.seek(-1, IO::Seek::Current)
file.gets(1) # => "c"
