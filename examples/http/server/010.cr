# http/server.cr:203
require "http/server"
server = HTTP::Server.new { }
server.bind_unix(Socket::UNIXAddress.new("/tmp/my-socket.sock"))
