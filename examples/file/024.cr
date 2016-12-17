# file.cr:377
File.expand_path("foo")             # => "/home/.../foo"
File.expand_path("~/crystal/foo")   # => "/home/crystal/foo"
File.expand_path("baz", "/foo/bar") # => "/foo/bar/baz"
