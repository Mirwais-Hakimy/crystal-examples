# io.cr:582
io = IO::Memory.new "hello\nworld"
io.gets(3) # => "hel"
io.gets(3) # => "lo\n"
io.gets(3) # => "wor"
io.gets(3) # => "ld"
io.gets(3) # => nil
