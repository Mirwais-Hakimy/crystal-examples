# socket/address.cr:168
require "socket"
ip_address = socket.remote_address
ip_address.address # => "127.0.0.1"
