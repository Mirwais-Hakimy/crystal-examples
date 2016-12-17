# http/multipart/builder.cr: 2 examples
require "http"

# http/multipart/builder.cr:6 (001.cr)
# pending by 'file:pendings/http/multipart/builder/001.cr'
# io = IO::Memory.new # This is a stub. Actually, any IO can be used.
# multipart = HTTP::Multipart::Builder.new(io)
# multipart.body_part HTTP::Headers{"Content-Type" => "text/plain"}, "hello!"
# multipart.finish
# io.to_s # => "----------------------------DTf61dRTHYzprx7rwVQhTWr7\r\nContent-Type: text/plain\r\n\r\nhello!\r\n----------------------------DTf61dRTHYzprx7rwVQhTWr7--"

# http/multipart/builder.cr:27 (002.cr)
io = IO::Memory.new # This is a stub. Actually, any IO can be used.
builder = HTTP::Multipart::Builder.new(io, "a4VF")
builder.content_type("mixed") # => "multipart/mixed; boundary=\"a4VF\""
