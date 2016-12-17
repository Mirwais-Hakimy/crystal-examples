# file/tempfile.cr:5
require "file/tempfile"
File.tempname("foo", ".sock") # => "/tmp/foo20171206-1234-449386.sock"
