# file.cr:108
File.size("foo") # raises Errno
File.write("foo", "foo")
File.size("foo") # => 3
