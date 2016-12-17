# atomic.cr:22
atomic = Atomic.new(1)

atomic.compare_and_set(2, 3) # => {1, false}
atomic.get                   # => 1

atomic.compare_and_set(1, 3) # => {1, true}
atomic.get                   # => 3
