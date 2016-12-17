# file.cr:294
File.chown("foo", gid: 100)                        # changes foo's gid
File.chown("foo", gid: 100, follow_symlinks: true) # changes baz's gid
