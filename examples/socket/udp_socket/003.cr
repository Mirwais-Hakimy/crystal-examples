# socket/udp_socket.cr:62
require "socket"
server = UDPSocket.new
server.bind("localhost", 1234)

message, client_addr = server.receive
