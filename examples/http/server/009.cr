# http/server.cr:189
require "http/server"
server = HTTP::Server.new { }
server.bind_unix "/tmp/my-socket.sock"
