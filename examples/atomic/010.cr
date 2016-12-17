# atomic.cr:154
atomic = Atomic.new(5)
atomic.swap(10) # => 5
atomic.get      # => 10
