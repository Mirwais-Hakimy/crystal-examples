# http/server.cr:179
require "http/server"
server = HTTP::Server.new { }
server.bind_unused_port # => Socket::IPAddress.new("127.0.0.1", 12345)
