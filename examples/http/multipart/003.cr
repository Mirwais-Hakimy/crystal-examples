# http/multipart.cr:50
require "http"
headers = HTTP::Headers{"Content-Type" => "multipart/mixed; boundary=aA40"}
body = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
request = HTTP::Request.new("POST", "/", headers, body)

HTTP::Multipart.parse(request) do |headers, io|
  headers["Content-Type"] # => "text/plain"
  io.gets_to_end          # => "body"
end
