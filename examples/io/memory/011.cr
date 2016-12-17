# io/memory.cr:372
io = IO::Memory.new "hello"
io.close
# io.gets_to_end # raises IO::Error (closed stream)
