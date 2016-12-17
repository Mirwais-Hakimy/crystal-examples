# io.cr:820
io = IO::Memory.new "hello world"
io.skip(6)
io.gets    # => "world"
# io.skip(1) # raises IO::EOFError
