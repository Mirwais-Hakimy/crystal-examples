# named_tuple.cr:206
a = {foo: "Hello", bar: "Old"}
b = {bar: "New", baz: "Bye"}
a.merge(b) # => {foo: "Hello", bar: "New", baz: "Bye"}
