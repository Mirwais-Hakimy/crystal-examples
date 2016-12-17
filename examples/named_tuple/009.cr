# named_tuple.cr:165
tuple = {name: "Crystal", year: 2011}
tuple.fetch(:name, "Unknown") # => "Crystal"
tuple.fetch("year", 0)        # => 2011
tuple.fetch(:other, 0)        # => 0
