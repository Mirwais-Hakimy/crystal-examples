# io/memory.cr:281
io = IO::Memory.new "hello"
io.size # => 5
