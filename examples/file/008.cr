# file.cr:127
File.delete("foo") if File.exists?("foo")
File.exists?("foo") # => false
File.write("foo", "foo")
File.exists?("foo") # => true
