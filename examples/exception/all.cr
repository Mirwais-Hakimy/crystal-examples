# exception.cr: 5 examples

# exception.cr:74 (001.cr)
a = [:foo, :bar]
# a[2] # raises IndexError

# exception.cr:86 (002.cr)
# [1, 2, 3].first(-4) # raises ArgumentError (attempt to take negative size)

# exception.cr:97 (003.cr)
# [1, "hi"][1].as(Int32) # raises TypeCastError (cast to Int32 failed)

# exception.cr:114 (004.cr)
h = {"foo" => "bar"}
# h["baz"] # raises KeyError (Missing hash key: "baz")

# exception.cr:123 (005.cr)
# 1 / 0 # raises DivisionByZeroError (Division by 0)
