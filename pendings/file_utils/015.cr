# file_utils.cr:234
require "file_utils"
# Create symbolic links in src/ pointing to every .c file in the current directory,
# even if it means overwriting files in src/
FileUtils.ln_sf(Dir["*.c"], "src")
