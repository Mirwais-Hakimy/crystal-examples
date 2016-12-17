# mime.cr:5
require "mime"

MIME.from_extension(".html")         # => "text/html; charset=utf-8"
MIME.from_filename("path/file.html") # => "text/html; charset=utf-8"
