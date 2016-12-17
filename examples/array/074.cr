# array.cr:1748
a = [[:a, :b], [:c, :d], [:e, :f]]
a.transpose # => [[:a, :c, :e], [:b, :d, :f]]
a           # => [[:a, :b], [:c, :d], [:e, :f]]
