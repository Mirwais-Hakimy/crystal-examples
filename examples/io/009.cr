# io.cr:205
io = IO::Memory.new
io.print 1, '-', "Crystal"
io.to_s # => "1-Crystal"
