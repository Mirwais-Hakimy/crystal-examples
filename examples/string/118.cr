# string.cr:3706
chars = "ab☃".each_char
chars.next # => 'a'
chars.next # => 'b'
chars.next # => '☃'
