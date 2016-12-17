# file_utils.cr:152
require "file_utils"
# Create a hard link, pointing from /usr/bin/emacs to /usr/bin/vim
FileUtils.ln("/usr/bin/vim", "/usr/bin/emacs")
# Create a hard link, pointing from /tmp/foo.c to foo.c
FileUtils.ln("foo.c", "/tmp")
