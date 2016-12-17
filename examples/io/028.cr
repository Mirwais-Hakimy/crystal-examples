# io.cr:846
io = IO::Memory.new
io.write_byte 97_u8
io.to_s # => "a"
