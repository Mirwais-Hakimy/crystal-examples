require "spec"
require "socket"
it "socket/address.cr" do
puts # :nocode:

puts "# socket/address.cr:66 (001.cr)" # :nocode: :example:
Socket::IPAddress.new("127.0.0.1", 8080)
Socket::IPAddress.new("fe80::2ab2:bdff:fe59:8e2c", 1234)

puts "# socket/address.cr:121 (002.cr)" # :nocode: :example:
( Socket::IPAddress.parse("tcp://127.0.0.1:8080") ).should eq( Socket::IPAddress.new("127.0.0.1", 8080) )
( Socket::IPAddress.parse("udp://[::1]:8080") ).should eq( Socket::IPAddress.new("::1", 8080) )

puts "# socket/address.cr:168 (003.cr)" # :nocode: :example:
# pending by 'file:pendings/socket/address/002.cr' # :pending:
# ip_address = socket.remote_address
# ip_address.address # => "127.0.0.1"

puts "# socket/address.cr:295 (004.cr)" # :nocode: :example:
Socket::UNIXAddress.new("/tmp/my.sock")

puts "# socket/address.cr:325 (005.cr)" # :nocode: :example:
( Socket::UNIXAddress.parse("unix:///foo.sock") ).should eq( Socket::UNIXAddress.new("/foo.sock") )
( Socket::UNIXAddress.parse("unix://foo.sock") ).should eq( Socket::UNIXAddress.new("foo.sock") )


end
