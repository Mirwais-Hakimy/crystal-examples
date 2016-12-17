# string.cr:3765
codepoints = "ab☃".each_codepoint
codepoints.next # => 97
codepoints.next # => 98
codepoints.next # => 9731
