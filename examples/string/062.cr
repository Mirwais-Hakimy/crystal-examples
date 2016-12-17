# string.cr:1744
"hello".sub(/(he|l|o)/, {"he": "ha", "l": "la"}) # => "hallo"
"hello".sub(/(he|l|o)/, {"l": "la"})             # => "hello"
