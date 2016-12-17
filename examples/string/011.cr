# string.cr:115
# Octal escape sequences
"\101" # # => "A"
"\12"  # # => "\n"
"\1"   # string with one character with code point 1
"\377" # string with one byte with value 255

# Hexadecimal escape sequences
"\x41" # # => "A"
"\xFF" # string with one byte with value 255
