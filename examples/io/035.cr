# io.cr:964
io = IO::Memory.new("あめ")
iter = io.each_char
iter.next # => 'あ'
iter.next # => 'め'
