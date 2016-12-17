# http/multipart/parser.cr: 2 examples
require "http"

# http/multipart/parser.cr:6 (001.cr)
multipart = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
parser = HTTP::Multipart::Parser.new(IO::Memory.new(multipart), "aA40")

while parser.has_next?
  parser.next do |headers, io|
    headers["Content-Type"] # => "text/plain"
    io.gets_to_end          # => "body"
  end
end

# http/multipart/parser.cr:38 (002.cr)
multipart = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
parser = HTTP::Multipart::Parser.new(IO::Memory.new(multipart), "aA40")
parser.next do |headers, io|
  headers["Content-Type"] # => "text/plain"
  io.gets_to_end          # => "body"
end
