require "spec"
require "http"
it "http/formdata/parser.cr" do
puts # :nocode:

puts "# http/formdata/parser.cr:17 (001.cr)" # :nocode: :example:
form_data = "--aA40\r\nContent-Disposition: form-data; name=\"field1\"; filename=\"foo.txt\"; size=13\r\nContent-Type: text/plain\r\n\r\nfield data\r\n--aA40--"
parser = HTTP::FormData::Parser.new(IO::Memory.new(form_data), "aA40")
parser.next do |part|
(   part.name ).to_s.should eq( "field1" )
(   part.body.gets_to_end ).to_s.should eq( "field data" )
(   part.filename ).to_s.should eq( "foo.txt" )
(   part.size ).should eq( 13 )
(   part.headers["Content-Type"] ).to_s.should eq( "text/plain" )
end


end
