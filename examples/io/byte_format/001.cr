# io/byte_format.cr:6
require "io/byte_format"
bytes = Bytes[0x34, 0x12]
int16 = IO::ByteFormat::LittleEndian.decode(Int16, bytes)
int16 # => 0x1234_i16
