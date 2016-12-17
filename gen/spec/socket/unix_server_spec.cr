require "spec"
require "socket"
puts "# socket/unix_server.cr:8 (001.cr)" # :nocode: :example:
# require "socket"

def handle_client(client)
  message = client.gets
  client.puts message
end

server = UNIXServer.new("/tmp/myapp.sock")
while client = server.accept?
  spawn handle_client(client)
end

puts "# socket/unix_server.cr:31 (002.cr)" # :nocode: :example:
UNIXServer.new("/tmp/dgram.sock", Socket::Type::DGRAM)

