# io.cr:999
io = IO::Memory.new("aあ")
iter = io.each_byte
iter.next # => 97
iter.next # => 227
iter.next # => 129
iter.next # => 130
