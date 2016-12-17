# hash.cr:689
hash = {:a => 1, :b => 2, :c => 3}
hash.transform_keys { |key| key.to_s } # => {"A" => 1, "B" => 2, "C" => 3}
