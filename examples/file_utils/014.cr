# file_utils.cr:216
require "file_utils"
# Create a symbolic link pointing from bar.c to foo.c, even if bar.c already exists
FileUtils.ln_sf("foo.c", "bar.c")
