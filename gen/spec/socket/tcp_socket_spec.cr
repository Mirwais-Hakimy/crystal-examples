require "spec"
require "socket"
it "socket/tcp_socket.cr" do
puts # :nocode:

puts "# socket/tcp_socket.cr:6 (001.cr)" # :nocode: :example:
# require "socket"

client = TCPSocket.new("localhost", 1234)
client << "message\n"
response = client.gets
client.close


end
