# io/memory.cr:17
io = IO::Memory.new
slice = Bytes.new(1)
io.pos         # => 0
io.read(slice) # => 0
slice          # => Bytes[0]
