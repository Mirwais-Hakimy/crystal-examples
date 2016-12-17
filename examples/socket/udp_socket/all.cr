# socket/udp_socket.cr: 4 examples
require "socket"

# socket/udp_socket.cr:20 (001.cr)
require "socket"

# Create server
server = UDPSocket.new
server.bind "localhost", 1234

# Create client and connect to server
client = UDPSocket.new
client.connect "localhost", 1234

# Send a text message to server
client.send "message"

# Receive text message from client
message, client_addr = server.receive

# Close client and server
client.close
server.close

# socket/udp_socket.cr:46 (002.cr)
begin
  client.send(message, @destination)
rescue ex : Errno
  if ex.errno == Errno::ECONNREFUSED
    p ex.inspect
  end
end

# socket/udp_socket.cr:62 (003.cr)
server = UDPSocket.new
server.bind("localhost", 1234)

message, client_addr = server.receive

# socket/udp_socket.cr:80 (004.cr)
server = UDPSocket.new
server.bind "localhost", 1234

message = Bytes.new(32)
bytes_read, client_addr = server.receive(message)
