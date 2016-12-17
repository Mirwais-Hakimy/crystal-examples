# socket.cr:146
sock = Socket.tcp(Socket::Family::INET)
sock.bind "localhost", 1234
