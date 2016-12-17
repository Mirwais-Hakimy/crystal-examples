# uri.cr:12
require "uri"

uri = URI.parse "http://foo.com/posts?id=30&limit=5#time=1305298413"
# => #<URI:0x1003f1e40 @scheme="http", @host="foo.com", @port=nil, @path="/posts", @query="id=30&limit=5", ... >
uri.scheme # => "http"
uri.host   # => "foo.com"
uri.query  # => "id=30&limit=5"
uri.to_s   # => "http://foo.com/posts?id=30&limit=5#time=1305298413"
