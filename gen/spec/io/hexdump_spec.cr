require "spec"
require "io/hexdump"
it "io/hexdump.cr" do
puts # :nocode:

puts "# io/hexdump.cr:10 (001.cr)" # :nocode: :example:
# require "io/hexdump"
socket = IO::Memory.new("abc")
io = IO::Hexdump.new(socket, output: STDERR, read: true)


end
