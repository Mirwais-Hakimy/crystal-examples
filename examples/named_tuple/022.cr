# named_tuple.cr:452
tuple = {name: "Crystal", year: 2011}
tuple.map { |k, v| "#{k}: #{v}" } # => ["name: Crystal", "year: 2011"]
