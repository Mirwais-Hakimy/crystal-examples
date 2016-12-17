# ini.cr:61
require "ini"
INI.build({"foo" => {"a" => "1"}}, true) # => "[foo]\na = 1\n\n"
