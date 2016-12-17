# file.cr:766
File.join({"foo", "bar", "baz"})       # => "foo/bar/baz"
File.join({"foo/", "/bar/", "/baz"})   # => "foo/bar/baz"
File.join(["/foo/", "/bar/", "/baz/"]) # => "/foo/bar/baz/"
