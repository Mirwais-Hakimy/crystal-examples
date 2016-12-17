require "spec"
require "ini"
it "ini.cr" do
puts # :nocode:

puts "# ini.cr:19 (001.cr)" # :nocode: :example:
( INI.parse("[foo]\na = 1") ).should eq( {"foo" => {"a" => "1"}} )

puts "# ini.cr:61 (002.cr)" # :nocode: :example:
( INI.build({"foo" => {"a" => "1"}}, true) ).to_s.should eq( "[foo]\na = 1\n\n" )


end
