# socket.cr:115
sock = Socket.unix
sock.connect Socket::UNIXAddress.new("/tmp/service.sock")
