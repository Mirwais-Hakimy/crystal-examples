# io/memory.cr:395
io = IO::Memory.new
io.print 1, 2, 3
io.to_s # => "123"
