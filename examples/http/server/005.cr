# http/server.cr:131
require "http/server"
server = HTTP::Server.new { }
server.bind_tcp("127.0.0.100", 8080) # => Socket::IPAddress.new("127.0.0.100", 8080)
