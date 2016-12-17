# tuple.cr:56
def splat_test(*args)
  args
end

tuple = splat_test 1, "hello", 'x'
tuple.class # => Tuple(Int32, String, Char)
tuple       # => {1, "hello", 'x'}
