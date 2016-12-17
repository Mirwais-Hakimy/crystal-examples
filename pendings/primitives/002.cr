# primitives.cr:19
random_value = rand # => 0.627423
value = random_value < 0.5 ? 1 : "hello"
value         # => "hello"
value.class   # => String
typeof(value) # => Int32 | String
