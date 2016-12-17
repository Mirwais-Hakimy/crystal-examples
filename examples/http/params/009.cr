# http/params.cr:174
require "http/params"
Params.new.empty?                              # => true
Params.parse("foo=bar&foo=baz&qux=zoo").empty? # => false
