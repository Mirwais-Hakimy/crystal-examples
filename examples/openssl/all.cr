# openssl.cr: 2 examples
require "socket"

# openssl.cr:25 (001.cr)
require "socket"
require "openssl"

def server
  # Bind new TCPSocket to port 5555
  socket = TCPServer.new(5555)

  context = OpenSSL::SSL::Context::Server.new
  context.private_key = "/path/to/private.key"
  context.certificate_chain = "/path/to/public.cert"

  puts "Server is up"

  socket.accept do |client|
    puts "Got client"

    bytes = Bytes.new(20)

    ssl_socket = OpenSSL::SSL::Socket::Server.new(client, context)
    ssl_socket.read(bytes)

    puts String.new(bytes)
  end
end

# openssl.cr:54 (002.cr)
require "socket"
require "openssl"

def client
  socket = TCPSocket.new("127.0.0.1", 5555)
  context = OpenSSL::SSL::Context::Client.new

  ssl_socket = OpenSSL::SSL::Socket::Client.new(socket, context)
  ssl_socket << "Testing"
end
