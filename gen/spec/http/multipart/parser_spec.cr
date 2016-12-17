require "spec"
require "http"
it "http/multipart/parser.cr" do
puts # :nocode:

puts "# http/multipart/parser.cr:6 (001.cr)" # :nocode: :example:
multipart = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
parser = HTTP::Multipart::Parser.new(IO::Memory.new(multipart), "aA40")

while parser.has_next?
  parser.next do |headers, io|
(     headers["Content-Type"] ).to_s.should eq( "text/plain" )
(     io.gets_to_end ).to_s.should eq( "body" )
  end
end

puts "# http/multipart/parser.cr:38 (002.cr)" # :nocode: :example:
multipart = "--aA40\r\nContent-Type: text/plain\r\n\r\nbody\r\n--aA40--"
parser = HTTP::Multipart::Parser.new(IO::Memory.new(multipart), "aA40")
parser.next do |headers, io|
(   headers["Content-Type"] ).to_s.should eq( "text/plain" )
(   io.gets_to_end ).to_s.should eq( "body" )
end


end
