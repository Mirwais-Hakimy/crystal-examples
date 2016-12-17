# io.cr:1122
io = IO::Memory.new "hello"
io2 = IO::Memory.new

IO.copy io, io2

io2.to_s # => "hello"
