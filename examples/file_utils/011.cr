# file_utils.cr:169
require "file_utils"
# Create /usr/bin/vim, /usr/bin/emacs, and /usr/bin/nano as hard links
FileUtils.ln(["vim", "emacs", "nano"], "/usr/bin")
