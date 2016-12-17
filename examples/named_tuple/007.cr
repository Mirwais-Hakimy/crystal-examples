# named_tuple.cr:127
h = {a: {b: [10, 20, 30]}}
h.dig? "a", "b"                # => [10, 20, 30]
h.dig? "a", "b", "c", "d", "e" # => nil
