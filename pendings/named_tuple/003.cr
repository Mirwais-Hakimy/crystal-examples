# named_tuple.cr:42
NamedTuple(foo: String, bar: Int64).from({:foo => "world", :bar => 2})       # => {foo: "world", bar: 2}
NamedTuple(foo: String, bar: Int64).from({"foo" => "world", "bar" => 2})     # => {foo: "world", bar: 2}
NamedTuple(foo: String, bar: Int64).from({:foo => "world", :bar => 2}).class # => {foo: String, bar: Int64}
