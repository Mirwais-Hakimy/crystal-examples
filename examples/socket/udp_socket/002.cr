# socket/udp_socket.cr:46
require "socket"
begin
  client.send(message, @destination)
rescue ex : Errno
  if ex.errno == Errno::ECONNREFUSED
    p ex.inspect
  end
end
