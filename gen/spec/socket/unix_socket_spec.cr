require "spec"
require "socket"
it "socket/unix_socket.cr" do
puts # :nocode:

puts "# socket/unix_socket.cr:6 (001.cr)" # :nocode: :example:
# require "socket"

sock = UNIXSocket.new("/tmp/myapp.sock")
sock.puts "message"
response = sock.gets
sock.close

puts "# socket/unix_socket.cr:51 (002.cr)" # :nocode: :example:
left, right = UNIXSocket.pair

spawn do
  # echo server
  message = right.gets
  right.puts message
end

left.puts "message"
( left.gets ).to_s.should eq( "message" )


end
