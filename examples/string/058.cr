# string.cr:1684
"hello".sub(/./) { |s| s[0].ord.to_s + ' ' } # => "104 ello"
