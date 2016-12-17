require "spec"
require "openssl"
require "socket"
it "openssl/ssl/server.cr" do
puts # :nocode:

puts "# openssl/ssl/server.cr:5 (001.cr)" # :nocode: :example:
# require "socket"
# require "openssl"

tcp_server = TCPServer.new(0)

ssl_context = OpenSSL::SSL::Context::Server.new
ssl_context.certificate_chain = "openssl.crt"
ssl_context.private_key = "openssl.key"
ssl_server = OpenSSL::SSL::Server.new(tcp_server, ssl_context)

puts "SSL Server listening on #{tcp_server.local_address}"
while connection = ssl_server.accept?
  connection.puts "secure message"
  connection.close
end


end
