# number.cr:58
floats = Float64.static_array(1, 2, 3, 4)
floats.class # => StaticArray(Float64, 4)

ints = Int64.static_array(1, 2, 3)
ints.class # => StaticArray(Int64, 3)
