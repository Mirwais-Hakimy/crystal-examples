# socket/server.cr: 4 examples
require "socket"

# socket/server.cr:5 (001.cr)
require "socket"

server = TCPServer.new(2202)
while true
  socket = server.accept
  socket.puts Time.utc_now
  socket.close
end

# socket/server.cr:23 (002.cr)
require "socket"

server = TCPServer.new(2202)
while socket = server.accept?
  socket.puts Time.utc_now
  socket.close
end

# socket/server.cr:40 (003.cr)
require "socket"

server = TCPServer.new(2202)
server.accept do |socket|
  socket.puts Time.now
end

# socket/server.cr:63 (004.cr)
require "socket"

server = UNIXServer.new("/tmp/service.sock")
server.accept? do |socket|
  socket.puts Time.now
end
