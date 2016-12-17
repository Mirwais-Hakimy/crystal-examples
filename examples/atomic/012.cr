# atomic.cr:182
atomic = Atomic.new(5)
atomic.lazy_set(10) # => 10
atomic.get          # => 10
