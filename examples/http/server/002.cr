# http/server.cr:49
require "http/server"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world!"
end

server.bind_tcp "0.0.0.0", 8080
puts "Listening on http://0.0.0.0:8080"
server.listen
