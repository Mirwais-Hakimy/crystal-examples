# socket/unix_server.cr: 2 examples
require "socket"

# socket/unix_server.cr:8 (001.cr)
require "socket"

def handle_client(client)
  message = client.gets
  client.puts message
end

server = UNIXServer.new("/tmp/myapp.sock")
while client = server.accept?
  spawn handle_client(client)
end

# socket/unix_server.cr:31 (002.cr)
UNIXServer.new("/tmp/dgram.sock", Socket::Type::DGRAM)
