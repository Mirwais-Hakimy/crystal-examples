# file.cr:192
File.write("foo", "foo")
File.executable?("foo") # => false
