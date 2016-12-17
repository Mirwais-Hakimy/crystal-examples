# socket/server.cr:63
require "socket"

server = UNIXServer.new("/tmp/service.sock")
server.accept? do |socket|
  socket.puts Time.now
end
