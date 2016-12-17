# io/byte_format.cr:14
require "io/byte_format"
io = IO::Memory.new(Bytes[0x34, 0x12])
int16 = io.read_bytes(Int16, IO::ByteFormat::LittleEndian)
int16 # => 0x1234_i16
