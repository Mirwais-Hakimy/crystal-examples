# socket/udp_socket.cr:80
require "socket"
server = UDPSocket.new
server.bind "localhost", 1234

message = Bytes.new(32)
bytes_read, client_addr = server.receive(message)
