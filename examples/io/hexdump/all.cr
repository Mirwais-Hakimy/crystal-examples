# io/hexdump.cr: 1 examples
require "io/hexdump"

# io/hexdump.cr:10 (001.cr)
require "io/hexdump"
socket = IO::Memory.new("abc")
io = IO::Hexdump.new(socket, output: STDERR, read: true)
