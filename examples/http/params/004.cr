# http/params.cr:94
require "http/params"
HTTP::Params.encode({foo: "bar", baz: "qux"}) # => "foo=bar&baz=qux"
