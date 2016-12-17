# io/memory.cr:268
io = IO::Memory.new "hello"
io.gets(2) # => "he"
io.rewind
io.gets(2) # => "he"
