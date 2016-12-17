# file.cr:219
File.write("foo", "")
Dir.mkdir("dir2")
File.directory?("foo")    # => false
File.directory?("dir2")   # => true
File.directory?("foobar") # => false
