# socket/server.cr:5
require "socket"

server = TCPServer.new(2202)
while true
  socket = server.accept
  socket.puts Time.utc_now
  socket.close
end
