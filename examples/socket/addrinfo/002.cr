# socket/addrinfo.cr:138
require "socket"
addrinfos = Socket::Addrinfo.tcp("example.org", 80)
