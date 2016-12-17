# http/server.cr:236
require "http/server"
server = HTTP::Server.new { }
context = OpenSSL::SSL::Context::Server.new
context.certificate_chain = "openssl.crt"
context.private_key = "openssl.key"
address = server.bind_tls "127.0.0.1", context
