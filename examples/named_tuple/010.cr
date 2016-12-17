# named_tuple.cr:177
tuple = {name: "Crystal", year: 2011}
tuple.fetch(:name) { "Unknown" } # => "Crystal"
tuple.fetch(:other) { 0 }        # => 0
