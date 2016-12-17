require "spec"
require "http"
it "http/multipart.cr" do
puts # :nocode:

puts "# http/multipart.cr:15 (001.cr)" # :nocode: :example:
multipart = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
HTTP::Multipart.parse(IO::Memory.new(multipart), "aA40") do |headers, io|
(   headers["Content-Type"] ).to_s.should eq( "text/plain" )
(   io.gets_to_end ).to_s.should eq( "body" )
end

puts "# http/multipart.cr:34 (002.cr)" # :nocode: :example:
( HTTP::Multipart.parse_boundary("multipart/mixed; boundary=\"abcde\"") ).to_s.should eq( "abcde" )

puts "# http/multipart.cr:50 (003.cr)" # :nocode: :example:
headers = HTTP::Headers{"Content-Type" => "multipart/mixed; boundary=aA40"}
body = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
request = HTTP::Request.new("POST", "/", headers, body)

HTTP::Multipart.parse(request) do |headers, io|
(   headers["Content-Type"] ).to_s.should eq( "text/plain" )
(   io.gets_to_end ).to_s.should eq( "body" )
end

puts "# http/multipart.cr:89 (004.cr)" # :nocode: :example:
# pending by 'file:pendings/http/multipart/004.cr' # :pending:
# HTTP::Multipart.generate_boundary # => "---------------------------dQu6bXHYb4m5zrRC3xPTGwV"


end
