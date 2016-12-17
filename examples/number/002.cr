# number.cr:40
floats = Float64.slice(1, 2, 3, 4)
floats.class # => Slice(Float64)

ints = Int64.slice(1, 2, 3)
ints.class # => Slice(Int64)
