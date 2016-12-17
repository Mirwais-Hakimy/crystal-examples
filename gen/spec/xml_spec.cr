require "spec"
require "xml"
it "xml.cr" do
puts # :nocode:

puts "# xml.cr:9 (001.cr)" # :nocode: :example:
# require "xml"

xml = <<-XML
 <person id="1">
  <firstname>Jane</firstname>
  <lastname>Doe</lastname>
 </person>
XML

document = XML.parse(xml)             # : XML::Node
person = document.first_element_child # : XML::Node?
if person
  puts person["id"] # "1" : String?

  puts typeof(person.children)                       # XML::NodeSet
  person.children.select(&.element?).each do |child| # Select only element children
    puts typeof(child)                               # XML::Node
    puts child.name                                  # firstname : String
    puts child.content                               # Jane : String?
  end
end

puts "# xml.cr:37 (002.cr)" # :nocode: :example:
# require "xml"

string = XML.build(indent: "  ") do |xml|
  xml.element("person", id: 1) do
    xml.element("firstname") { xml.text "Jane" }
    xml.element("lastname") { xml.text "Doe" }
  end
end

( string ).to_s.should eq( "<?xml version=\"1.0\"?>\n<person id=\"1\">\n  <firstname>Jane</firstname>\n  <lastname>Doe</lastname>\n</person>\n" )


end
