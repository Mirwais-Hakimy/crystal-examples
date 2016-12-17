# socket.cr:280
server = Socket::IPAddress.new("10.0.3.1", 2022)
sock = Socket.udp(Socket::Family::INET)
sock.connect("example.com", 2000)
sock.send("text query", to: server)
