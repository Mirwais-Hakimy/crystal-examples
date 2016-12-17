# atomic.cr:61
atomic = Atomic.new(9)
atomic.sub(2) # => 9
atomic.get    # => 7
