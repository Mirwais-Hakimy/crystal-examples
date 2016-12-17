require "spec"
require "http/cookie"
it "http/cookie.cr" do
puts # :nocode:

puts "# http/cookie.cr:167 (001.cr)" # :nocode: :example:
request = HTTP::Request.new "GET", "/"
request.cookies["foo"] = "bar"

puts "# http/cookie.cr:179 (002.cr)" # :nocode: :example:
response = HTTP::Client::Response.new(200)
response.cookies["foo"] = HTTP::Cookie.new("foo", "bar", "/admin", Time.now + 12.hours, secure: true)

puts "# http/cookie.cr:193 (003.cr)" # :nocode: :example:
( request.cookies["foo"].value ).to_s.should eq( "bar" )

puts "# http/cookie.cr:202 (004.cr)" # :nocode: :example:
request = HTTP::Request.new "GET", "/"
( request.cookies["foo"]? ).should eq( nil )
request.cookies["foo"] = "bar"
request.cookies["foo"]?.try &.value # > "bar"

puts "# http/cookie.cr:214 (005.cr)" # :nocode: :example:
( request.cookies.has_key?("foo") ).should eq( true )

puts "# http/cookie.cr:224 (006.cr)" # :nocode: :example:
response.cookies << HTTP::Cookie.new("foo", "bar", http_only: true)


end
