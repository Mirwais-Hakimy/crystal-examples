# socket/unix_server.cr:8
require "socket"

def handle_client(client)
  message = client.gets
  client.puts message
end

server = UNIXServer.new("/tmp/myapp.sock")
while client = server.accept?
  spawn handle_client(client)
end
