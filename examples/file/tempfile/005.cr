# file/tempfile.cr:89
require "file/tempfile"
tempfile = File.tempfile("foo", ".bar") do |file|
  file.print("bar")
end
File.read(tempfile.path) # => "bar"
tempfile.delete
