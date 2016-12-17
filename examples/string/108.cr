# string.cr:3230
ary = [] of String
long_river_name = "Mississippi"

long_river_name.split(/s+/) { |s| ary << s }
ary # => ["Mi", "i", "ippi"]
ary.clear

long_river_name.split(//) { |s| ary << s }
ary # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]
