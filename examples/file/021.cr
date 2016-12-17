# file.cr:307
File.chmod("foo", 0o755)
File.info("foo").permissions.value # => 0o755

File.chmod("foo", 0o700)
File.info("foo").permissions.value # => 0o700
