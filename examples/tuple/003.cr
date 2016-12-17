# tuple.cr:43
def multiply(string, value)
  string * value
end

tuple = {"hey", 2}
value = multiply(*tuple) # same as multiply tuple[0], tuple[1]
value                    # => "heyhey"
