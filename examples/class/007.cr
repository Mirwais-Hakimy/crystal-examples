# class.cr:117
klass = Int32
number = [99, "str"][0]
typeof(number)             # => (String | Int32)
typeof(klass.cast(number)) # => Int32
