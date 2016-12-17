# io.cr:176
io = IO::Memory.new
io << 1
io << '-'
io << "Crystal"
io.to_s # => "1-Crystal"
