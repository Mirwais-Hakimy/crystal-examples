# named_tuple.cr:9
language = {name: "Crystal", year: 2011} # NamedTuple(name: String, year: Int32)

language[:name]  # => "Crystal"
language[:year]  # => 2011
# language[:other] # compile time error
