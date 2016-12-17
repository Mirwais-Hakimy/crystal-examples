# file/tempfile.cr:50
require "file/tempfile"
tempfile = File.tempfile("foo", ".bar")
tempfile.delete
