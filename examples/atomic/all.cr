# atomic.cr: 12 examples

# atomic.cr:22 (001.cr)
atomic = Atomic.new(1)

atomic.compare_and_set(2, 3) # => {1, false}
atomic.get                   # => 1

atomic.compare_and_set(1, 3) # => {1, true}
atomic.get                   # => 3

# atomic.cr:50 (002.cr)
atomic = Atomic.new(1)
atomic.add(2) # => 1
atomic.get    # => 3

# atomic.cr:61 (003.cr)
atomic = Atomic.new(9)
atomic.sub(2) # => 9
atomic.get    # => 7

# atomic.cr:72 (004.cr)
atomic = Atomic.new(5)
atomic.and(3) # => 5
atomic.get    # => 1

# atomic.cr:83 (005.cr)
atomic = Atomic.new(5)
atomic.nand(3) # => 5
atomic.get     # => -2

# atomic.cr:94 (006.cr)
atomic = Atomic.new(5)
atomic.or(2) # => 5
atomic.get   # => 7

# atomic.cr:105 (007.cr)
atomic = Atomic.new(5)
atomic.xor(3) # => 5
atomic.get    # => 6

# atomic.cr:116 (008.cr)
atomic = Atomic.new(5)

atomic.max(3) # => 5
atomic.get    # => 5

atomic.max(10) # => 5
atomic.get     # => 10

# atomic.cr:135 (009.cr)
atomic = Atomic.new(5)

atomic.min(10) # => 5
atomic.get     # => 5

atomic.min(3) # => 5
atomic.get    # => 3

# atomic.cr:154 (010.cr)
atomic = Atomic.new(5)
atomic.swap(10) # => 5
atomic.get      # => 10

# atomic.cr:170 (011.cr)
atomic = Atomic.new(5)
atomic.set(10) # => 10
atomic.get     # => 10

# atomic.cr:182 (012.cr)
atomic = Atomic.new(5)
atomic.lazy_set(10) # => 10
atomic.get          # => 10
