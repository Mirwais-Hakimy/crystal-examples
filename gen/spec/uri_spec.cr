require "spec"
require "uri"
it "uri.cr" do
puts # :nocode:

puts "# uri.cr:12 (001.cr)" # :nocode: :example:
# require "uri"

uri = URI.parse "http://foo.com/posts?id=30&limit=5#time=1305298413"
# => #<URI:0x1003f1e40 @scheme="http", @host="foo.com", @port=nil, @path="/posts", @query="id=30&limit=5", ... >
( uri.scheme ).to_s.should eq( "http" )
( uri.host ).to_s.should eq( "foo.com" )
( uri.query ).to_s.should eq( "id=30&limit=5" )
uri.to_s   # => "http://foo.com/posts?id=30&limit=5#time=1305298413"

puts "# uri.cr:28 (002.cr)" # :nocode: :example:
( URI.parse("http://foo.com").scheme ).to_s.should eq( "http" )
( URI.parse("mailto:alice@example.com").scheme ).to_s.should eq( "mailto" )

puts "# uri.cr:39 (003.cr)" # :nocode: :example:
( URI.parse("http://foo.com").host ).to_s.should eq( "foo.com" )

puts "# uri.cr:49 (004.cr)" # :nocode: :example:
( URI.parse("http://foo.com:5432").port ).should eq( 5432 )

puts "# uri.cr:59 (005.cr)" # :nocode: :example:
( URI.parse("http://foo.com/bar").path ).to_s.should eq( "/bar" )

puts "# uri.cr:69 (006.cr)" # :nocode: :example:
( URI.parse("http://foo.com/bar?q=1").query ).to_s.should eq( "q=1" )

puts "# uri.cr:79 (007.cr)" # :nocode: :example:
( URI.parse("http://admin:password@foo.com").user ).to_s.should eq( "admin" )

puts "# uri.cr:89 (008.cr)" # :nocode: :example:
( URI.parse("http://admin:password@foo.com").password ).to_s.should eq( "password" )

puts "# uri.cr:99 (009.cr)" # :nocode: :example:
( URI.parse("http://foo.com/bar#section1").fragment ).to_s.should eq( "section1" )

puts "# uri.cr:109 (010.cr)" # :nocode: :example:
( URI.parse("mailto:alice@example.com").opaque ).to_s.should eq( "alice@example.com" )

puts "# uri.cr:124 (011.cr)" # :nocode: :example:
( URI.parse("http://[::1]/bar").hostname ).to_s.should eq( "::1" )
( URI.parse("http://[::1]/bar").host ).to_s.should eq( "[::1]" )

puts "# uri.cr:134 (012.cr)" # :nocode: :example:
uri = URI.parse "http://foo.com/posts?id=30&limit=5#time=1305298413"
( uri.full_path ).to_s.should eq( "/posts?id=30&limit=5" )

puts "# uri.cr:205 (013.cr)" # :nocode: :example:
# require "uri"

( uri = URI.parse("http://crystal-lang.org") ).class.to_s.should eq( "URI" )
( uri.scheme ).to_s.should eq( "http" )
( uri.host ).to_s.should eq( "crystal-lang.org" )

puts "# uri.cr:221 (014.cr)" # :nocode: :example:
( URI.unescape("%27Stop%21%27%20said%20Fred") ).to_s.should eq( "'Stop!' said Fred" )
( URI.unescape("%27Stop%21%27+said+Fred", plus_to_space: true) ).to_s.should eq( "'Stop!' said Fred" )

puts "# uri.cr:262 (015.cr)" # :nocode: :example:
( URI.escape("'Stop!' said Fred") ).to_s.should eq( "%27Stop%21%27%20said%20Fred" )
( URI.escape("'Stop!' said Fred", space_to_plus: true) ).to_s.should eq( "%27Stop%21%27+said+Fred" )

puts "# uri.cr:276 (016.cr)" # :nocode: :example:
# Escape URI path
URI.escape("/foo/file?(1).txt") do |byte|
  URI.unreserved?(byte) || byte.chr == '/'
end
# => "/foo/file%3F%281%29.txt"

puts "# uri.cr:335 (017.cr)" # :nocode: :example:
uri = URI.parse "http://admin:password@foo.com"
( uri.userinfo ).to_s.should eq( "admin:password" )

puts "# uri.cr:509 (018.cr)" # :nocode: :example:
( URI.default_port "http" ).should eq( 80 )
( URI.default_port "ponzi" ).should eq( nil )

puts "# uri.cr:522 (019.cr)" # :nocode: :example:
URI.set_default_port "ponzi", 9999


end
