# io/memory.cr:235
io = IO::Memory.new
io << "abc"
io.rewind
io.gets(1) # => "a"
io.clear
io.pos         # => 0
io.gets_to_end # => ""

io = IO::Memory.new "hello"
# io.clear # raises IO::Error
