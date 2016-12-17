# tuple.cr:397
tuple = {1, 2.5, "a"}
tuple.map &.to_s # => {"1", "2.5", "a"}
