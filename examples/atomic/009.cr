# atomic.cr:135
atomic = Atomic.new(5)

atomic.min(10) # => 5
atomic.get     # => 5

atomic.min(3) # => 5
atomic.get    # => 3
