# http/server.cr:163
require "http/server"
server = HTTP::Server.new { }
server.bind_tcp(Socket::IPAddress.new("127.0.0.100", 8080)) # => Socket::IPAddress.new("127.0.0.100", 8080)
server.bind_tcp(Socket::IPAddress.new("127.0.0.100", 0))    # => Socket::IPAddress.new("127.0.0.100", 35487)
