# socket/tcp_socket.cr:6
require "socket"

client = TCPSocket.new("localhost", 1234)
client << "message\n"
response = client.gets
client.close
