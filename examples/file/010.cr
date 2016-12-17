# file.cr:160
File.write("foo", "")
File.empty?("foo") # => true
File.write("foo", "foo")
File.empty?("foo") # => false
