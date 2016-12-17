# http/server.cr:266
require "http/server"
server = HTTP::Server.new { }
server.bind("tcp://localhost:80")  # => Socket::IPAddress.new("127.0.0.1", 8080)
server.bind("unix:///tmp/server.sock")  # => Socket::UNIXAddress.new("/tmp/server.sock")
server.bind("tls://127.0.0.1:443?key=private.key&cert=certificate.cert&ca=ca.crt)  # => Socket::IPAddress.new("127.0.0.1", 443)
