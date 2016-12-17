# ini.cr:19
require "ini"
INI.parse("[foo]\na = 1") # => {"foo" => {"a" => "1"}}
