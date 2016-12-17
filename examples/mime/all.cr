# mime.cr: 3 examples
require "mime"

# mime.cr:5 (001.cr)
require "mime"

MIME.from_extension(".html")         # => "text/html; charset=utf-8"
MIME.from_filename("path/file.html") # => "text/html; charset=utf-8"

# mime.cr:40 (002.cr)
require "mime"
MIME.from_extension?(".cr")     # => nil
MIME.extensions("text/crystal") # => Set(String).new

MIME.register(".cr", "text/crystal")
MIME.from_extension?(".cr")     # => "text/crystal"
MIME.extensions("text/crystal") # => Set(String){".cr"}

# mime.cr:55 (003.cr)
# Load user-defined MIME types
File.open("~/.mime.types") do |io|
  MIME.load_mime_database(io)
end
