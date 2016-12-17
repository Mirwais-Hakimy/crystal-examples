# http/server.cr:149
require "http/server"
server = HTTP::Server.new { }
server.bind_tcp(8080) # => Socket::IPAddress.new("127.0.0.1", 8080)
