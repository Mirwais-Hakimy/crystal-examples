# io/byte_format.cr: 4 examples
require "io/byte_format"

# io/byte_format.cr:6 (001.cr)
bytes = Bytes[0x34, 0x12]
int16 = IO::ByteFormat::LittleEndian.decode(Int16, bytes)
int16 # => 0x1234_i16

# io/byte_format.cr:14 (002.cr)
io = IO::Memory.new(Bytes[0x34, 0x12])
int16 = io.read_bytes(Int16, IO::ByteFormat::LittleEndian)
int16 # => 0x1234_i16

# io/byte_format.cr:22 (003.cr)
raw = uninitialized UInt8[2]
IO::ByteFormat::LittleEndian.encode(0x1234_i16, raw.to_slice)
raw # => StaticArray[0x34, 0x12]

# io/byte_format.cr:30 (004.cr)
io = IO::Memory.new
io.write_bytes(0x1234_i16, IO::ByteFormat::LittleEndian)
io.to_slice # => Bytes[0x34, 0x12]
