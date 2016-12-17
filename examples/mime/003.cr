# mime.cr:55
require "mime"
# Load user-defined MIME types
File.open("~/.mime.types") do |io|
  MIME.load_mime_database(io)
end
