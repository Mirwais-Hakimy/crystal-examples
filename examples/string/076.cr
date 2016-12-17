# string.cr:2104
# "he" and "l" are matched and replaced,
# but "o" is not and so is not included
"hello".gsub(/(he|l|o)/, {"he": "ha", "l": "la"}) # => "halala"
