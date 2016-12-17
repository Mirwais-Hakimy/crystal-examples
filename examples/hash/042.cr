# hash.cr:702
hash = {:a => 1, :b => 2, :c => 3}
hash.transform_values { |value| value + 1 } # => {:a => 2, :b => 3, :c => 4}
