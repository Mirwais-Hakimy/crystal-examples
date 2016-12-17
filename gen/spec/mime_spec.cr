require "spec"
require "mime"
it "mime.cr" do
puts # :nocode:

puts "# mime.cr:5 (001.cr)" # :nocode: :example:
# require "mime"

( MIME.from_extension(".html") ).to_s.should eq( "text/html; charset=utf-8" )
( MIME.from_filename("path/file.html") ).to_s.should eq( "text/html; charset=utf-8" )

puts "# mime.cr:40 (002.cr)" # :nocode: :example:
# require "mime"
( MIME.from_extension?(".cr") ).should eq( nil )
( MIME.extensions("text/crystal") ).should eq( Set(String).new )

MIME.register(".cr", "text/crystal")
( MIME.from_extension?(".cr") ).to_s.should eq( "text/crystal" )
( MIME.extensions("text/crystal") ).should eq( Set(String){".cr"} )

puts "# mime.cr:55 (003.cr)" # :nocode: :example:
# Load user-defined MIME types
File.open("~/.mime.types") do |io|
  MIME.load_mime_database(io)
end


end
