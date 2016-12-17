# socket/address.cr: 5 examples
require "socket"

# socket/address.cr:66 (001.cr)
Socket::IPAddress.new("127.0.0.1", 8080)
Socket::IPAddress.new("fe80::2ab2:bdff:fe59:8e2c", 1234)

# socket/address.cr:121 (002.cr)
Socket::IPAddress.parse("tcp://127.0.0.1:8080") # => Socket::IPAddress.new("127.0.0.1", 8080)
Socket::IPAddress.parse("udp://[::1]:8080")     # => Socket::IPAddress.new("::1", 8080)

# socket/address.cr:168 (003.cr)
# pending by 'file:pendings/socket/address/002.cr'
# ip_address = socket.remote_address
# ip_address.address # => "127.0.0.1"

# socket/address.cr:295 (004.cr)
Socket::UNIXAddress.new("/tmp/my.sock")

# socket/address.cr:325 (005.cr)
Socket::UNIXAddress.parse("unix:///foo.sock") # => Socket::UNIXAddress.new("/foo.sock")
Socket::UNIXAddress.parse("unix://foo.sock")  # => Socket::UNIXAddress.new("foo.sock")
