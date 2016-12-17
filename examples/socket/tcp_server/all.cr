# socket/tcp_server.cr: 2 examples
require "socket"

# socket/tcp_server.cr:6 (001.cr)
require "socket"

def handle_client(client)
  message = client.gets
  client.puts message
end

server = TCPServer.new("localhost", 1234)
while client = server.accept?
  spawn handle_client(client)
end

# socket/tcp_server.cr:92 (002.cr)
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
