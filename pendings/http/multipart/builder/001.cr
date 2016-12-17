# http/multipart/builder.cr:6
require "http/multipart/builder"
io = IO::Memory.new
multipart = HTTP::Multipart::Builder.new(io)
multipart.body_part HTTP::Headers{"Content-Type" => "text/plain"}, "hello!"
multipart.finish
io.to_s # => "----------------------------DTf61dRTHYzprx7rwVQhTWr7\r\nContent-Type: text/plain\r\n\r\nhello!\r\n----------------------------DTf61dRTHYzprx7rwVQhTWr7--"
