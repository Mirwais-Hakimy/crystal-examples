require "spec"
require "http"
it "http/multipart/builder.cr" do
puts # :nocode:

puts "# http/multipart/builder.cr:6 (001.cr)" # :nocode: :example:
# pending by 'file:pendings/http/multipart/builder/001.cr' # :pending:
# io = IO::Memory.new # This is a stub. Actually, any IO can be used.
# multipart = HTTP::Multipart::Builder.new(io)
# multipart.body_part HTTP::Headers{"Content-Type" => "text/plain"}, "hello!"
# multipart.finish
# io.to_s # => "----------------------------DTf61dRTHYzprx7rwVQhTWr7\r\nContent-Type: text/plain\r\n\r\nhello!\r\n----------------------------DTf61dRTHYzprx7rwVQhTWr7--"

puts "# http/multipart/builder.cr:27 (002.cr)" # :nocode: :example:
io = IO::Memory.new # This is a stub. Actually, any IO can be used.
builder = HTTP::Multipart::Builder.new(io, "a4VF")
( builder.content_type("mixed") ).to_s.should eq( "multipart/mixed; boundary=\"a4VF\"" )


end
