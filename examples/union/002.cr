# union.cr:22
(Int32 | String).nilable? # => false
(Int32 | Nil).nilable?    # => true
