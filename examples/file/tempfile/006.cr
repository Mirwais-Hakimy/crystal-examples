# file/tempfile.cr:117
require "file/tempfile"
tempfile = File.tempfile(".bar") do |file|
  file.print("bar")
end
File.read(tempfile.path) # => "bar"
tempfile.delete
