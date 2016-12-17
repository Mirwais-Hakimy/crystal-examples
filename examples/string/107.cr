# string.cr:3155
ary = [] of String
long_river_name = "Mississippi"

long_river_name.split("ss") { |s| ary << s }
ary # => ["Mi", "i", "ippi"]
ary.clear

long_river_name.split("i") { |s| ary << s }
ary # => ["M", "ss", "ss", "pp", ""]
ary.clear

long_river_name.split("i", remove_empty: true) { |s| ary << s }
ary # => ["M", "ss", "ss", "pp"]
ary.clear

long_river_name.split("") { |s| ary << s }
ary # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]
