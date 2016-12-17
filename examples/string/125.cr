# string.cr:3810
bytes = "ab☃".each_byte
bytes.next # => 97
bytes.next # => 98
bytes.next # => 226
bytes.next # => 152
bytes.next # => 131
