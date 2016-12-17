# socket/server.cr:40
require "socket"

server = TCPServer.new(2202)
server.accept do |socket|
  socket.puts Time.now
end
