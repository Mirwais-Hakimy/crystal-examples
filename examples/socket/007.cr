# socket.cr:221
require "socket"

server = TCPServer.new(2202)
if socket = server.accept?
  socket.puts Time.now
  socket.close
end
