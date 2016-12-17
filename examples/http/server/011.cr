# http/server.cr:216
require "http/server"
server = HTTP::Server.new { }
context = OpenSSL::SSL::Context::Server.new
context.certificate_chain = "openssl.crt"
context.private_key = "openssl.key"
server.bind_tls "127.0.0.1", 8080, context
