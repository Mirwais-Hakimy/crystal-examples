# named_tuple.cr:519
tuple1 = {name: "Crystal", year: 2011}
tuple2 = {year: 2011, name: "Crystal"}
tuple3 = {name: "Crystal", year: 2012}
tuple4 = {name: "Crystal", year: 2011.0}

tuple1 == tuple2 # => true
tuple1 == tuple3 # => false
tuple1 == tuple4 # => true
