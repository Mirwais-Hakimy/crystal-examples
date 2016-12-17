# io.cr:439
io = IO::Memory.new("hello world")
io.read_string(5) # => "hello"
io.read_string(1) # => " "
# io.read_string(6) # raises IO::EOFError
