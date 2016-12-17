# string.cr:3258
long_river_name = "Mississippi"
long_river_name.split(/s+/) # => ["Mi", "i", "ippi"]
long_river_name.split(//)   # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]
