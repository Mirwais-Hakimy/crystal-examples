# file.cr:41
File.write("foo", "foo")
File.stat?("foo").try(&.size) # => 3
File.stat?("non_existent")    # => nil
