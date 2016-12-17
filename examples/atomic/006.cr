# atomic.cr:94
atomic = Atomic.new(5)
atomic.or(2) # => 5
atomic.get   # => 7
