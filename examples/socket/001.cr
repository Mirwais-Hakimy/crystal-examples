# socket.cr:103
sock = Socket.tcp(Socket::Family::INET)
sock.connect "crystal-lang.org", 80
