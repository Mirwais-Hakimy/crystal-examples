# socket/udp_socket.cr:20
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
