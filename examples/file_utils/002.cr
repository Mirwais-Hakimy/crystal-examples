# file_utils.cr:20
require "file_utils"
FileUtils.cd("/tmp") { Dir.current } # => "/tmp"
