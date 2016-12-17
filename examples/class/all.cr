# class.cr: 9 examples

# class.cr:13 (001.cr)
Int32 == Int32  # => true
Int32 == String # => false

# class.cr:23 (002.cr)
Int32 < Number  # => true
Int32 < Value   # => true
Int32 < Int32   # => false
Int32 <= String # => false

# class.cr:38 (003.cr)
Int32 < Number  # => true
Int32 < Value   # => true
Int32 <= Int32  # => true
Int32 <= String # => false

# class.cr:52 (004.cr)
Number > Int32  # => true
Number > Number # => false
Number > Object # => false

# class.cr:66 (005.cr)
Number >= Int32  # => true
Number >= Number # => true
Number >= Object # => false

# class.cr:103 (006.cr)
String.name # => "String"

# class.cr:117 (007.cr)
klass = Int32
number = [99, "str"][0]
typeof(number)             # => (String | Int32)
typeof(klass.cast(number)) # => Int32

# class.cr:129 (008.cr)
Int32 | Char # => (Int32 | Char)

# class.cr:140 (009.cr)
Int32.nilable? # => false
Nil.nilable?   # => true
