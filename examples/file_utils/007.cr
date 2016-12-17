# file_utils.cr:102
require "file_utils"
File.chmod("afile", 0o600)
FileUtils.cp("afile", "afile_copy")
File.info("afile_copy").permissions.value # => 0o600
