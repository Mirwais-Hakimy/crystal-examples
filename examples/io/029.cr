# io.cr:864
io = IO::Memory.new
io.write_bytes(0x01020304, IO::ByteFormat::LittleEndian)
io.rewind
io.gets(4) # => "\u{4}\u{3}\u{2}\u{1}"
