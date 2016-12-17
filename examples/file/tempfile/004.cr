# file/tempfile.cr:70
require "file/tempfile"
tempfile = File.tempfile(".bar")
tempfile.delete
