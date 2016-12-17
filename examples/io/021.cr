# io.cr:539
io = IO::Memory.new "hello world"
io.gets_to_end # => "hello world"
