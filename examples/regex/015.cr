# regex.cr:264
Regex.error?("(foo|bar)") # => nil
Regex.error?("(foo|bar")  # => "missing ) at 8"
