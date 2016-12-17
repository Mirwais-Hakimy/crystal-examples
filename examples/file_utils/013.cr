# file_utils.cr:201
require "file_utils"
# Create symbolic links in src/ pointing to every .c file in the current directory
FileUtils.ln_s(Dir["*.c"], "src")
