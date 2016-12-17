# socket.cr:257
sock = Socket.udp(Socket::Family::INET)
sock.connect("example.com", 2000)
sock.send("text message")

sock = Socket.unix(Socket::Type::DGRAM)
sock.connect Socket::UNIXAddress.new("/tmp/service.sock")
sock.send(Bytes[0])
