# socket/tcp_socket.cr: 1 examples
require "socket"

# socket/tcp_socket.cr:6 (001.cr)
require "socket"

client = TCPSocket.new("localhost", 1234)
client << "message\n"
response = client.gets
client.close
