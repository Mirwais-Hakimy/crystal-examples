# union.cr: 2 examples

# union.cr:14 (001.cr)
Union(Int32 | String)      # => (Int32 | String)
Union(Int32)               # => Int32
Union(Int32, Int32, Int32) # => Int32

# union.cr:22 (002.cr)
(Int32 | String).nilable? # => false
(Int32 | Nil).nilable?    # => true
