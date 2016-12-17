# atomic.cr:170
atomic = Atomic.new(5)
atomic.set(10) # => 10
atomic.get     # => 10
