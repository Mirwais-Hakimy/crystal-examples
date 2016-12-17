require "spec"
require "socket"
it "socket/server.cr" do
puts # :nocode:

puts "# socket/server.cr:5 (001.cr)" # :nocode: :example:
# require "socket"

server = TCPServer.new(2202)
while true
  socket = server.accept
  socket.puts Time.utc_now
  socket.close
end

puts "# socket/server.cr:23 (002.cr)" # :nocode: :example:
# require "socket"

server = TCPServer.new(2202)
while socket = server.accept?
  socket.puts Time.utc_now
  socket.close
end

puts "# socket/server.cr:40 (003.cr)" # :nocode: :example:
# require "socket"

server = TCPServer.new(2202)
server.accept do |socket|
  socket.puts Time.now
end

puts "# socket/server.cr:63 (004.cr)" # :nocode: :example:
# require "socket"

server = UNIXServer.new("/tmp/service.sock")
server.accept? do |socket|
  socket.puts Time.now
end


end
