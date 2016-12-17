# http/params.cr:25
require "http/params"
query = "foo=bar&foo=baz&qux=zoo"
HTTP::Params.parse(query) do |key, value|
  # ...
end
