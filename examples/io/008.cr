# io.cr:190
io = IO::Memory.new
io.print 1
io.print '-'
io.print "Crystal"
io.to_s # => "1-Crystal"
