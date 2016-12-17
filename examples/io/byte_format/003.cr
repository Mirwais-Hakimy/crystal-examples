# io/byte_format.cr:22
require "io/byte_format"
raw = uninitialized UInt8[2]
IO::ByteFormat::LittleEndian.encode(0x1234_i16, raw.to_slice)
raw # => StaticArray[0x34, 0x12]
