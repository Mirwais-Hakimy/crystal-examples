require "spec"

it "system.cr" do
puts # :nocode:

puts "# system.cr:10 (001.cr)" # :nocode: :example:
( System.hostname ).to_s.should eq( "host.example.org" )

puts "# system.cr:19 (002.cr)" # :nocode: :example:
( System.cpu_count ).should eq( 4 )


end
