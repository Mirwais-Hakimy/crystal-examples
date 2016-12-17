# string.cr:2043
"hello".gsub(/./) { |s| s[0].ord.to_s + ' ' } # => "104 101 108 108 111 "
