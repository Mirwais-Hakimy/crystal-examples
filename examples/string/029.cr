# string.cr:997
"string\r\n".chomp # => "string"
"string\n\r".chomp # => "string\n"
"string\n".chomp   # => "string"
"string".chomp     # => "string"
"x".chomp.chomp    # => "x"
