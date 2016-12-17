# openssl.cr:25
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
