# file.cr:95
File.write("foo", "foo")
File.info?("foo").try(&.size) # => 3
File.info?("non_existent")    # => nil

File.symlink("foo", "bar")
File.info?("bar", follow_symlinks: false).try(&.type.symlink?) # => true
