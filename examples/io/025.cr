# io.cr:611
io = IO::Memory.new "hello\nworld"
io.gets('o', 3)  # => "hel"
io.gets('r', 10) # => "lo\nwor"
io.gets('z', 10) # => "ld"
io.gets('w', 10) # => nil
