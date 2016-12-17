# socket/address.cr:121
require "socket"
Socket::IPAddress.parse("tcp://127.0.0.1:8080") # => Socket::IPAddress.new("127.0.0.1", 8080)
Socket::IPAddress.parse("udp://[::1]:8080")     # => Socket::IPAddress.new("::1", 8080)
