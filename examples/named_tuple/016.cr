# named_tuple.cr:296
tuple = {name: "Crystal", year: 2011}
tuple.has_key?(:name)  # => true
tuple.has_key?(:other) # => false
