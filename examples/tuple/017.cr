# tuple.cr:331
t1 = {1, 2}
t2 = {"foo", "bar"}
t3 = t1 + t2
t3         # => {1, 2, "foo", "bar"}
typeof(t3) # => Tuple(Int32, Int32, String, String)
