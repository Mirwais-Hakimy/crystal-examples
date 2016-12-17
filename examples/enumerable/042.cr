# enumerable.cr:921
["Alice", "Bob", "Carl"].minmax_by { |name| name.size } # => {"Bob", "Alice"}
