# socket/addrinfo.cr:155
require "socket"
addrinfos = Socket::Addrinfo.udp("example.org", 53)
