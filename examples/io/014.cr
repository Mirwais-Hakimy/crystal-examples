# io.cr:286
io = IO::Memory.new "a"
io.read_byte # => 97
io.read_byte # => nil
