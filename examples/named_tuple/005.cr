# named_tuple.cr:90
tuple = {name: "Crystal", year: 2011}

key = :name
tuple[key] # => "Crystal"

key = "year"
tuple[key] # => 2011

key = :other
# tuple[key] # raises KeyError
