# socket.cr:313
server = Socket.udp(Socket::Family::INET)
server.bind("localhost", 1234)

message = Bytes.new(32)
bytes_read, client_addr = server.receive(message)
