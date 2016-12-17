# io.cr:1142
io = IO::Memory.new "hello"
io2 = IO::Memory.new

IO.copy io, io2, 3

io2.to_s # => "hel"
