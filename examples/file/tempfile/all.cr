# file/tempfile.cr: 6 examples
require "file/tempfile"

# file/tempfile.cr:5 (001.cr)
File.tempname("foo", ".sock") # => "/tmp/foo20171206-1234-449386.sock"

# file/tempfile.cr:40 (002.cr)
File.tempname          # => "/tmp/20171206-1234-449386"
File.tempname(".sock") # => "/tmp/20171206-1234-449386.sock"

# file/tempfile.cr:50 (003.cr)
tempfile = File.tempfile("foo", ".bar")
tempfile.delete

# file/tempfile.cr:70 (004.cr)
tempfile = File.tempfile(".bar")
tempfile.delete

# file/tempfile.cr:89 (005.cr)
tempfile = File.tempfile("foo", ".bar") do |file|
  file.print("bar")
end
File.read(tempfile.path) # => "bar"
tempfile.delete

# file/tempfile.cr:117 (006.cr)
tempfile = File.tempfile(".bar") do |file|
  file.print("bar")
end
File.read(tempfile.path) # => "bar"
tempfile.delete
