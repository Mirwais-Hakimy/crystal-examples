# string.cr:1706
"hello".sub(/[aeiou]/, "(\\0)") # => "h(e)llo"
