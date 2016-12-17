# socket.cr:204
require "socket"

server = TCPServer.new(2202)
socket = server.accept
socket.puts Time.now
socket.close
