# io/memory.cr:328
io = IO::Memory.new "hello"
io.pos = 3
io.gets # => "lo"
