# socket/unix_socket.cr: 2 examples
require "socket"

# socket/unix_socket.cr:6 (001.cr)
require "socket"

sock = UNIXSocket.new("/tmp/myapp.sock")
sock.puts "message"
response = sock.gets
sock.close

# socket/unix_socket.cr:51 (002.cr)
left, right = UNIXSocket.pair

spawn do
  # echo server
  message = right.gets
  right.puts message
end

left.puts "message"
left.gets # => "message"
