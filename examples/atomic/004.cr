# atomic.cr:72
atomic = Atomic.new(5)
atomic.and(3) # => 5
atomic.get    # => 1
