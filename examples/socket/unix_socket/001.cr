# socket/unix_socket.cr:6
require "socket"

sock = UNIXSocket.new("/tmp/myapp.sock")
sock.puts "message"
response = sock.gets
sock.close
