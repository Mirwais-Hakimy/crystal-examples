# io/byte_format.cr:30
require "io/byte_format"
io = IO::Memory.new
io.write_bytes(0x1234_i16, IO::ByteFormat::LittleEndian)
io.to_slice # => Bytes[0x34, 0x12]
