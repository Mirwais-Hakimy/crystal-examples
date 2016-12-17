# io/memory.cr:291
io = IO::Memory.new("abcdef")
io.gets(3) # => "abc"
io.seek(1, IO::Seek::Set)
io.gets(2) # => "bc"
io.seek(-1, IO::Seek::Current)
io.gets(1) # => "c"
