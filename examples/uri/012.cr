# uri.cr:134
require "uri"
uri = URI.parse "http://foo.com/posts?id=30&limit=5#time=1305298413"
uri.full_path # => "/posts?id=30&limit=5"
