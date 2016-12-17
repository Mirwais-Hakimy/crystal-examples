# io/memory.cr:406
io = IO::Memory.new
io.print "hello"

io.to_slice # => Bytes[104, 101, 108, 108, 111]
