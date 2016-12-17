# openssl.cr:54
require "socket"
require "openssl"

def client
  socket = TCPSocket.new("127.0.0.1", 5555)
  context = OpenSSL::SSL::Context::Client.new

  ssl_socket = OpenSSL::SSL::Socket::Client.new(socket, context)
  ssl_socket << "Testing"
end
