# http/params.cr:10
require "http/params"
HTTP::Params.parse("foo=bar&foo=baz&qux=zoo")
# => #<HTTP::Params @raw_params = {"foo" => ["bar", "baz"], "qux" => ["zoo"]}>
