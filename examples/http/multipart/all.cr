# http/multipart.cr: 4 examples
require "http"

# http/multipart.cr:15 (001.cr)
multipart = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
HTTP::Multipart.parse(IO::Memory.new(multipart), "aA40") do |headers, io|
  headers["Content-Type"] # => "text/plain"
  io.gets_to_end          # => "body"
end

# http/multipart.cr:34 (002.cr)
HTTP::Multipart.parse_boundary("multipart/mixed; boundary=\"abcde\"") # => "abcde"

# http/multipart.cr:50 (003.cr)
headers = HTTP::Headers{"Content-Type" => "multipart/mixed; boundary=aA40"}
body = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
request = HTTP::Request.new("POST", "/", headers, body)

HTTP::Multipart.parse(request) do |headers, io|
  headers["Content-Type"] # => "text/plain"
  io.gets_to_end          # => "body"
end

# http/multipart.cr:89 (004.cr)
# pending by 'file:pendings/http/multipart/004.cr'
# HTTP::Multipart.generate_boundary # => "---------------------------dQu6bXHYb4m5zrRC3xPTGwV"
