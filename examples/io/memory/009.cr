# io/memory.cr:316
io = IO::Memory.new "hello"
io.pos     # => 0
io.gets(2) # => "he"
io.pos     # => 2
