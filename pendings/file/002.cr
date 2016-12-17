# file.cr:61
File.write("foo", "foo")
File.info("foo").size              # => 3
File.info("foo").modification_time # => 2015-09-23 06:24:19 UTC

File.symlink("foo", "bar")
File.info("bar", follow_symlinks: false).type.symlink? # => true
