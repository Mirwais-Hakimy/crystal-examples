# socket/unix_socket.cr:51
require "socket"
left, right = UNIXSocket.pair

spawn do
  # echo server
  message = right.gets
  right.puts message
end

left.puts "message"
left.gets # => "message"
