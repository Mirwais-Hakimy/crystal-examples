# socket/server.cr:23
require "socket"

server = TCPServer.new(2202)
while socket = server.accept?
  socket.puts Time.utc_now
  socket.close
end
