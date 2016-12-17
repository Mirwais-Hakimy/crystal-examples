# uri.cr: 19 examples
require "uri"

# uri.cr:12 (001.cr)
require "uri"

uri = URI.parse "http://foo.com/posts?id=30&limit=5#time=1305298413"
# => #<URI:0x1003f1e40 @scheme="http", @host="foo.com", @port=nil, @path="/posts", @query="id=30&limit=5", ... >
uri.scheme # => "http"
uri.host   # => "foo.com"
uri.query  # => "id=30&limit=5"
uri.to_s   # => "http://foo.com/posts?id=30&limit=5#time=1305298413"

# uri.cr:28 (002.cr)
URI.parse("http://foo.com").scheme           # => "http"
URI.parse("mailto:alice@example.com").scheme # => "mailto"

# uri.cr:39 (003.cr)
URI.parse("http://foo.com").host # => "foo.com"

# uri.cr:49 (004.cr)
URI.parse("http://foo.com:5432").port # => 5432

# uri.cr:59 (005.cr)
URI.parse("http://foo.com/bar").path # => "/bar"

# uri.cr:69 (006.cr)
URI.parse("http://foo.com/bar?q=1").query # => "q=1"

# uri.cr:79 (007.cr)
URI.parse("http://admin:password@foo.com").user # => "admin"

# uri.cr:89 (008.cr)
URI.parse("http://admin:password@foo.com").password # => "password"

# uri.cr:99 (009.cr)
URI.parse("http://foo.com/bar#section1").fragment # => "section1"

# uri.cr:109 (010.cr)
URI.parse("mailto:alice@example.com").opaque # => "alice@example.com"

# uri.cr:124 (011.cr)
URI.parse("http://[::1]/bar").hostname # => "::1"
URI.parse("http://[::1]/bar").host     # => "[::1]"

# uri.cr:134 (012.cr)
uri = URI.parse "http://foo.com/posts?id=30&limit=5#time=1305298413"
uri.full_path # => "/posts?id=30&limit=5"

# uri.cr:205 (013.cr)
require "uri"

uri = URI.parse("http://crystal-lang.org") # => #<URI:0x1068a7e40 @scheme="http", @host="crystal-lang.org", ... >
uri.scheme                                 # => "http"
uri.host                                   # => "crystal-lang.org"

# uri.cr:221 (014.cr)
URI.unescape("%27Stop%21%27%20said%20Fred")                  # => "'Stop!' said Fred"
URI.unescape("%27Stop%21%27+said+Fred", plus_to_space: true) # => "'Stop!' said Fred"

# uri.cr:262 (015.cr)
URI.escape("'Stop!' said Fred")                      # => "%27Stop%21%27%20said%20Fred"
URI.escape("'Stop!' said Fred", space_to_plus: true) # => "%27Stop%21%27+said+Fred"

# uri.cr:276 (016.cr)
# Escape URI path
URI.escape("/foo/file?(1).txt") do |byte|
  URI.unreserved?(byte) || byte.chr == '/'
end
# => "/foo/file%3F%281%29.txt"

# uri.cr:335 (017.cr)
uri = URI.parse "http://admin:password@foo.com"
uri.userinfo # => "admin:password"

# uri.cr:509 (018.cr)
URI.default_port "http"  # => 80
URI.default_port "ponzi" # => nil

# uri.cr:522 (019.cr)
URI.set_default_port "ponzi", 9999
