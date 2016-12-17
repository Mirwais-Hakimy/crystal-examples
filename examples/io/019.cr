# io.cr:505
io = IO::Memory.new "123451234"
slice = Bytes.new(5)
io.read_fully(slice) # => 5
slice                # => Bytes[49, 50, 51, 52, 53]
# io.read_fully(slice) # raises IO::EOFError
