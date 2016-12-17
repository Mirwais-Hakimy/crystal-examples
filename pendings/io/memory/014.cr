# io/memory.cr:355
io = IO::Memory.new "hello"
slice = io.to_slice
slice[0] = 97_u8
io.gets_to_end # => "aello"
