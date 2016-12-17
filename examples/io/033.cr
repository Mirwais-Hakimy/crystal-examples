# io.cr:931
io = IO::Memory.new("hello\nworld")
iter = io.each_line
iter.next # => "hello"
iter.next # => "world"
