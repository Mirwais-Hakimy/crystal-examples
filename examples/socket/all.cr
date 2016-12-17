# socket.cr: 11 examples

# socket.cr:103 (001.cr)
sock = Socket.tcp(Socket::Family::INET)
sock.connect "crystal-lang.org", 80

# socket.cr:115 (002.cr)
sock = Socket.unix
sock.connect Socket::UNIXAddress.new("/tmp/service.sock")

# socket.cr:146 (003.cr)
sock = Socket.tcp(Socket::Family::INET)
sock.bind "localhost", 1234

# socket.cr:158 (004.cr)
sock = Socket.tcp(Socket::Family::INET6)
sock.bind 1234

# socket.cr:170 (005.cr)
sock = Socket.udp(Socket::Family::INET)
sock.bind Socket::IPAddress.new("192.168.1.25", 80)

# socket.cr:204 (006.cr)
require "socket"

server = TCPServer.new(2202)
socket = server.accept
socket.puts Time.now
socket.close

# socket.cr:221 (007.cr)
require "socket"

server = TCPServer.new(2202)
if socket = server.accept?
  socket.puts Time.now
  socket.close
end

# socket.cr:257 (008.cr)
sock = Socket.udp(Socket::Family::INET)
sock.connect("example.com", 2000)
sock.send("text message")

sock = Socket.unix(Socket::Type::DGRAM)
sock.connect Socket::UNIXAddress.new("/tmp/service.sock")
sock.send(Bytes[0])

# socket.cr:280 (009.cr)
server = Socket::IPAddress.new("10.0.3.1", 2022)
sock = Socket.udp(Socket::Family::INET)
sock.connect("example.com", 2000)
sock.send("text query", to: server)

# socket.cr:295 (010.cr)
server = Socket.udp(Socket::Family::INET)
server.bind("localhost", 1234)

message, client_addr = server.receive

# socket.cr:313 (011.cr)
server = Socket.udp(Socket::Family::INET)
server.bind("localhost", 1234)

message = Bytes.new(32)
bytes_read, client_addr = server.receive(message)
