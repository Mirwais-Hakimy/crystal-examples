# socket.cr:295
server = Socket.udp(Socket::Family::INET)
server.bind("localhost", 1234)

message, client_addr = server.receive
