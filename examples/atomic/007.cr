# atomic.cr:105
atomic = Atomic.new(5)
atomic.xor(3) # => 5
atomic.get    # => 6
