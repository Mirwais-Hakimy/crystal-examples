# tuple.cr:86
Tuple(String, Int64).from(["world", 2])       # => {"world", 2}
Tuple(String, Int64).from(["world", 2]).class # => {String, Int64}
