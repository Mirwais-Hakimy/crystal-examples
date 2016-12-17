# atomic.cr:83
atomic = Atomic.new(5)
atomic.nand(3) # => 5
atomic.get     # => -2
