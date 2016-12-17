# socket/unix_server.cr:31
require "socket"
UNIXServer.new("/tmp/dgram.sock", Socket::Type::DGRAM)
