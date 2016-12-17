# io/memory.cr:256
io = IO::Memory.new
io.empty? # => true
io.print "hello"
io.empty? # => false
