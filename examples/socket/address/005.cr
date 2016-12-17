# socket/address.cr:325
require "socket"
Socket::UNIXAddress.parse("unix:///foo.sock") # => Socket::UNIXAddress.new("/foo.sock")
Socket::UNIXAddress.parse("unix://foo.sock")  # => Socket::UNIXAddress.new("foo.sock")
