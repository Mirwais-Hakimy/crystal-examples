# tuple.cr:29
def one_and_hello
  {1, "hello"}
end

one, hello = one_and_hello
one   # => 1
hello # => "hello"
