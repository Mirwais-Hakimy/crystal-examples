# io/memory.cr:383
io = IO::Memory.new "hello"
io.closed? # => false
io.close
io.closed? # => true
