# file.cr:202
File.write("foo", "")
Dir.mkdir("dir1")
File.file?("foo")    # => true
File.file?("dir1")   # => false
File.file?("foobar") # => false
