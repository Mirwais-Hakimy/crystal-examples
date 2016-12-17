# io/file_descriptor.cr: 3 examples
require "io/file_descriptor"

# io/file_descriptor.cr:70 (001.cr)
File.write("testfile", "abc")

file = File.new("testfile")
file.gets(3) # => "abc"
file.seek(1, IO::Seek::Set)
file.gets(2) # => "bc"
file.seek(-1, IO::Seek::Current)
file.gets(1) # => "c"

# io/file_descriptor.cr:107 (002.cr)
File.write("testfile", "hello")

file = File.new("testfile")
file.pos     # => 0
file.gets(2) # => "he"
file.pos     # => 2

# io/file_descriptor.cr:123 (003.cr)
File.write("testfile", "hello")

file = File.new("testfile")
file.pos = 3
file.gets_to_end # => "lo"
