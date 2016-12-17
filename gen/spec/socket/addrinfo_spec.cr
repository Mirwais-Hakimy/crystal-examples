require "spec"
require "socket"
it "socket/addrinfo.cr" do
puts # :nocode:

puts "# socket/addrinfo.cr:27 (001.cr)" # :nocode: :example:
addrinfos = Socket::Addrinfo.resolve("example.org", "http", type: Socket::Type::STREAM, protocol: Socket::Protocol::TCP)

puts "# socket/addrinfo.cr:138 (002.cr)" # :nocode: :example:
addrinfos = Socket::Addrinfo.tcp("example.org", 80)

puts "# socket/addrinfo.cr:155 (003.cr)" # :nocode: :example:
addrinfos = Socket::Addrinfo.udp("example.org", 53)


end
