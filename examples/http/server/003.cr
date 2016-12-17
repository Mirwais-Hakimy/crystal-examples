# http/server.cr:66
require "http/server"

server = HTTP::Server.new([
  HTTP::ErrorHandler.new,
  HTTP::LogHandler.new,
  HTTP::CompressHandler.new,
  HTTP::StaticFileHandler.new("."),
])

server.bind_tcp "127.0.0.1", 8080
server.listen
