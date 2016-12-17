# file_utils.cr:32
require "file_utils"
File.write("file.cr", "1")
File.write("bar.cr", "1")
FileUtils.cmp("file.cr", "bar.cr") # => true
