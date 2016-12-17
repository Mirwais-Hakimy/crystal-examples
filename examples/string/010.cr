# string.cr:103
# here 255 is not a valid byte value in the UTF-8 encoding
string = String.new(Bytes[255, 97])
string.valid_encoding? # => false

# The first char here is the unicode replacement char
string.chars # => ['�', 'a']
