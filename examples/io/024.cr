# io.cr:597
io = IO::Memory.new "hello\nworld"
io.gets('o') # => "hello"
io.gets('r') # => "\nwor"
io.gets('z') # => "ld"
io.gets('w') # => nil
