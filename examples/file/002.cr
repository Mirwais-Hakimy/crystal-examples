# file.cr:23
tempfile = File.tempfile("foo")

File.size(tempfile.path)                   # => 6
File.info(tempfile.path).modification_time # => 2015-10-20 13:11:12 UTC
File.exists?(tempfile.path)                # => true
File.read_lines(tempfile.path)             # => ["foobar"]
