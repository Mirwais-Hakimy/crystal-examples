# ini.cr: 2 examples
require "ini"

# ini.cr:19 (001.cr)
INI.parse("[foo]\na = 1") # => {"foo" => {"a" => "1"}}

# ini.cr:61 (002.cr)
INI.build({"foo" => {"a" => "1"}}, true) # => "[foo]\na = 1\n\n"
