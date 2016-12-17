# io.cr:882
io = IO::Memory.new
io.puts "\u{4}\u{3}\u{2}\u{1}"
io.rewind
io.read_bytes(Int32, IO::ByteFormat::LittleEndian) # => 0x01020304
