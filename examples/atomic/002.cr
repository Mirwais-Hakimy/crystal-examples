# atomic.cr:50
atomic = Atomic.new(1)
atomic.add(2) # => 1
atomic.get    # => 3
