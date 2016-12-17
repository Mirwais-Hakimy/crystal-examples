# string.cr:1100
"string\r\n".rchop # => "string\r"
"string\n\r".rchop # => "string\n"
"string\n".rchop   # => "string"
"string".rchop     # => "strin"
"x".rchop.rchop    # => ""
