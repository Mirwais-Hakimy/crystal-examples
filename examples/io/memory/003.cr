# io/memory.cr:62
io = IO::Memory.new "hello"
io.pos        # => 0
io.gets(2)    # => "he"
# io.print "hi" # raises IO::Error
