# io.cr:93
io = IO::Memory.new "hello"
slice = Bytes.new(4)
io.read(slice) # => 4
slice          # => Bytes[104, 101, 108, 108]
io.read(slice) # => 1
slice          # => Bytes[111, 101, 108, 108]
io.read(slice) # => 0
