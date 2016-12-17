# socket/tcp_server.cr:92
require "socket"

server = TCPServer.new(2022)
loop do
  if socket = server.accept?
    # handle the client in a fiber
    spawn handle_connection(socket)
  else
    # another fiber closed the server
    break
  end
end
