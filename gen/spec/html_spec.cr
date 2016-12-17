require "spec"
require "html"
it "html.cr" do
puts # :nocode:

puts "# html.cr:18 (001.cr)" # :nocode: :example:
# require "html"

( HTML.escape("Crystal & You") ).to_s.should eq( "Crystal &amp; You" )

puts "# html.cr:30 (002.cr)" # :nocode: :example:
io = IO::Memory.new
( HTML.escape("Crystal & You", io) ).should eq( nil )
( io.to_s ).to_s.should eq( "Crystal &amp; You" )

puts "# html.cr:86 (003.cr)" # :nocode: :example:
( HTML.unescape("Crystal &amp; You") ).to_s.should eq( "Crystal & You" )


end
