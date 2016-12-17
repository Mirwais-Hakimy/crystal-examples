# string.cr:2065
"hello".gsub(/[aeiou]/, "(\\0)") # => "h(e)ll(o)"
