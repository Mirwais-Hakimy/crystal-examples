# http/server.cr: 14 examples
require "http/server"

# http/server.cr:34 (001.cr)
require "http/server"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world!"
end

server.bind_tcp 8080
puts "Listening on http://127.0.0.1:8080"
server.listen

# http/server.cr:49 (002.cr)
require "http/server"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world!"
end

server.bind_tcp "0.0.0.0", 8080
puts "Listening on http://0.0.0.0:8080"
server.listen

# http/server.cr:66 (003.cr)
require "http/server"

server = HTTP::Server.new([
  HTTP::ErrorHandler.new,
  HTTP::LogHandler.new,
  HTTP::CompressHandler.new,
  HTTP::StaticFileHandler.new("."),
])

server.bind_tcp "127.0.0.1", 8080
server.listen

# http/server.cr:84 (004.cr)
require "http/server"

server = HTTP::Server.new([
  HTTP::ErrorHandler.new,
  HTTP::LogHandler.new,
]) do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world!"
end

server.bind_tcp "0.0.0.0", 8080
server.listen

# http/server.cr:131 (005.cr)
server = HTTP::Server.new { }
server.bind_tcp("127.0.0.100", 8080) # => Socket::IPAddress.new("127.0.0.100", 8080)

# http/server.cr:149 (006.cr)
server = HTTP::Server.new { }
server.bind_tcp(8080) # => Socket::IPAddress.new("127.0.0.1", 8080)

# http/server.cr:163 (007.cr)
server = HTTP::Server.new { }
server.bind_tcp(Socket::IPAddress.new("127.0.0.100", 8080)) # => Socket::IPAddress.new("127.0.0.100", 8080)
server.bind_tcp(Socket::IPAddress.new("127.0.0.100", 0))    # => Socket::IPAddress.new("127.0.0.100", 35487)

# http/server.cr:179 (008.cr)
server = HTTP::Server.new { }
server.bind_unused_port # => Socket::IPAddress.new("127.0.0.1", 12345)

# http/server.cr:189 (009.cr)
server = HTTP::Server.new { }
server.bind_unix "/tmp/my-socket.sock"

# http/server.cr:203 (010.cr)
server = HTTP::Server.new { }
server.bind_unix(Socket::UNIXAddress.new("/tmp/my-socket.sock"))

# http/server.cr:216 (011.cr)
server = HTTP::Server.new { }
context = OpenSSL::SSL::Context::Server.new
context.certificate_chain = "openssl.crt"
context.private_key = "openssl.key"
server.bind_tls "127.0.0.1", 8080, context

# http/server.cr:236 (012.cr)
server = HTTP::Server.new { }
context = OpenSSL::SSL::Context::Server.new
context.certificate_chain = "openssl.crt"
context.private_key = "openssl.key"
address = server.bind_tls "127.0.0.1", context

# http/server.cr:251 (013.cr)
server = HTTP::Server.new { }
context = OpenSSL::SSL::Context::Server.new
context.certificate_chain = "openssl.crt"
context.private_key = "openssl.key"
address = server.bind_tls Socket::IPAddress.new("127.0.0.1", 8000), context

# http/server.cr:266 (014.cr)
server = HTTP::Server.new { }
server.bind("tcp://localhost:80")  # => Socket::IPAddress.new("127.0.0.1", 8080)
server.bind("unix:///tmp/server.sock")  # => Socket::UNIXAddress.new("/tmp/server.sock")
server.bind("tls://127.0.0.1:443?key=private.key&cert=certificate.cert&ca=ca.crt)  # => Socket::IPAddress.new("127.0.0.1", 443)
