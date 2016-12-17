# static_array.cr:248
ary = StaticArray(Int32, 3).new(42)
ary.to_unsafe[0] # => 42
