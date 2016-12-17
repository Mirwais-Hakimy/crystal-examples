# file_utils.cr:407
require "file_utils"
FileUtils.rm_rf(["dir", "file.cr", "non_existent_file"])
