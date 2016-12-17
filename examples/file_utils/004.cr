# file_utils.cr:50
require "file_utils"
File.write("afile", "123")
stream1 = File.open("afile")
stream2 = IO::Memory.new("123")
FileUtils.cmp(stream1, stream2) # => true
