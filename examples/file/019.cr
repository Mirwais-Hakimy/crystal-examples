# file.cr:285
File.chown("/foo/bar/baz.cr", 1001, 100)
File.chown("/foo/bar", gid: 100)
