# socket/address.cr:103
require "socket"
ip_address = socket.remote_address
ip_address.address # => "127.0.0.1"
