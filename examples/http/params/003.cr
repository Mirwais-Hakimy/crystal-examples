# http/params.cr:81
require "http/params"
HTTP::Params.encode({"foo" => "bar", "baz" => "qux"}) # => "foo=bar&baz=qux"
