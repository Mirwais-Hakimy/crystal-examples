# named_tuple.cr:43
num_or_str = 42.as(Int32 | String)
NamedTuple(name: String, val: Int32).from({"name" => "number", "val" => num_or_str}) # => {name: "number", val: 42}

num_or_str = "a string".as(Int32 | String)
# NamedTuple(name: String, val: Int32).from({"name" => "number", "val" => num_or_str}) # raises TypeCastError (cast from String to Int32 failed)
