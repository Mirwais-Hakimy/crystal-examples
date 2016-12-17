require "spec"
require "xml"
it "xml/node.cr" do
puts # :nocode:

puts "# xml/node.cr:498 (001.cr)" # :nocode: :example:
# require "xml"
doc = XML.parse("<person></person>")

( doc.xpath_bool("count(//person) > 0") ).should eq( true )

puts "# xml/node.cr:510 (002.cr)" # :nocode: :example:
( doc.xpath_float("count(//person)") ).try(&.to_f).to_s.should eq( "1.0" )

puts "# xml/node.cr:519 (003.cr)" # :nocode: :example:
nodes = doc.xpath_nodes("//person")
( nodes.class ).should eq( XML::NodeSet )
( nodes.map(&.name) ).should eq( ["person"] )

puts "# xml/node.cr:531 (004.cr)" # :nocode: :example:
( doc.xpath_node("//person") ).class.to_s.should eq( "XML::Node" )
( doc.xpath_node("//invalid") ).should eq( nil )

puts "# xml/node.cr:541 (005.cr)" # :nocode: :example:
doc.xpath_string("string(/persons/person[1])")


end
