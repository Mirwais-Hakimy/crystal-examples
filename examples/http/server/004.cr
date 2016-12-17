# http/server.cr:84
require "http/server"

server = HTTP::Server.new([
  HTTP::ErrorHandler.new,
  HTTP::LogHandler.new,
]) do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world!"
end

server.bind_tcp "0.0.0.0", 8080
server.listen
