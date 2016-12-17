# file.cr:146
File.size("foo") # raises Errno
File.write("foo", "foo")
File.size("foo") # => 3
