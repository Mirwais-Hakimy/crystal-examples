# http/formdata.cr:192
require "http"
io = IO::Memory.new
response = HTTP::Server::Response.new io
HTTP::FormData.build(response, "boundary") do |builder|
  builder.field("foo", "bar")
end
response.close

response.headers["Content-Type"] # => "multipart/form-data; boundary=\"boundary\""
io.to_s                          # => "HTTP/1.1 200 OK\r\nContent-Type: multipart/form-data; boundary=\"boundary\"\r\nContent-Length: 75\r\n\r\n--boundary\r\nContent-Disposition: form-data; name=\"foo\"\r\n\r\nbar\r\n--boundary--"
