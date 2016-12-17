# io.cr:303
io = IO::Memory.new "あ"
io.read_char # => 'あ'
io.read_char # => nil
