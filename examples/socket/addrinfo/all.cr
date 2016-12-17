# socket/addrinfo.cr: 3 examples
require "socket"

# socket/addrinfo.cr:27 (001.cr)
addrinfos = Socket::Addrinfo.resolve("example.org", "http", type: Socket::Type::STREAM, protocol: Socket::Protocol::TCP)

# socket/addrinfo.cr:138 (002.cr)
addrinfos = Socket::Addrinfo.tcp("example.org", 80)

# socket/addrinfo.cr:155 (003.cr)
addrinfos = Socket::Addrinfo.udp("example.org", 53)
