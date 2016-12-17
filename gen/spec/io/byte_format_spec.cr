require "spec"
require "io/byte_format"
it "io/byte_format.cr" do
puts # :nocode:

puts "# io/byte_format.cr:6 (001.cr)" # :nocode: :example:
bytes = Bytes[0x34, 0x12]
int16 = IO::ByteFormat::LittleEndian.decode(Int16, bytes)
( int16 ).should eq( 0x1234_i16 )

puts "# io/byte_format.cr:14 (002.cr)" # :nocode: :example:
io = IO::Memory.new(Bytes[0x34, 0x12])
int16 = io.read_bytes(Int16, IO::ByteFormat::LittleEndian)
( int16 ).should eq( 0x1234_i16 )

puts "# io/byte_format.cr:22 (003.cr)" # :nocode: :example:
raw = uninitialized UInt8[2]
IO::ByteFormat::LittleEndian.encode(0x1234_i16, raw.to_slice)
( raw ).should eq( StaticArray[0x34, 0x12] )

puts "# io/byte_format.cr:30 (004.cr)" # :nocode: :example:
io = IO::Memory.new
io.write_bytes(0x1234_i16, IO::ByteFormat::LittleEndian)
( io.to_slice ).should eq( Bytes[0x34, 0x12] )


end
