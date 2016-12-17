# file/tempfile.cr:40
require "file/tempfile"
File.tempname          # => "/tmp/20171206-1234-449386"
File.tempname(".sock") # => "/tmp/20171206-1234-449386.sock"
