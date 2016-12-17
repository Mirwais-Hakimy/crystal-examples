# socket.cr:170
sock = Socket.udp(Socket::Family::INET)
sock.bind Socket::IPAddress.new("192.168.1.25", 80)
