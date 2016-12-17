# io/hexdump.cr:10
require "io/hexdump"
socket = IO::Memory.new("abc")
io = IO::Hexdump.new(socket, output: STDERR, read: true)
