# string.cr:3131
long_river_name = "Mississippi"
long_river_name.split("ss")                    # => ["Mi", "i", "ippi"]
long_river_name.split("i")                     # => ["M", "ss", "ss", "pp", ""]
long_river_name.split("i", remove_empty: true) # => ["M", "ss", "ss", "pp"]
long_river_name.split("")                      # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]
