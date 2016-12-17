# file_utils.cr:184
require "file_utils"
# Create a symbolic link pointing from logs to /var/log
FileUtils.ln_s("/var/log", "logs")
# Create a symbolic link pointing from /tmp/src to src
FileUtils.ln_s("src", "/tmp")
