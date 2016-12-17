# atomic.cr:116
atomic = Atomic.new(5)

atomic.max(3) # => 5
atomic.get    # => 5

atomic.max(10) # => 5
atomic.get     # => 10
