# tuple.cr:413
tuple = {1, 2.5, "a"}
tuple.map_with_index { |e, i| "tuple[#{i}]: #{e}" } # => {"tuple[0]: 1", "tuple[1]: 2.5", "tuple[2]: a"}
