# mime.cr:40
require "mime"
MIME.from_extension?(".cr")     # => nil
MIME.extensions("text/crystal") # => Set(String).new

MIME.register(".cr", "text/crystal")
MIME.from_extension?(".cr")     # => "text/crystal"
MIME.extensions("text/crystal") # => Set(String){".cr"}
