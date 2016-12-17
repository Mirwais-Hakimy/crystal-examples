# file_utils.cr:119
require "file_utils"
Dir.mkdir("files")
FileUtils.cp({"bar.cr", "afile"}, "files")
