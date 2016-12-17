# http/multipart.cr:15
require "http"
multipart = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
HTTP::Multipart.parse(IO::Memory.new(multipart), "aA40") do |headers, io|
  headers["Content-Type"] # => "text/plain"
  io.gets_to_end          # => "body"
end
