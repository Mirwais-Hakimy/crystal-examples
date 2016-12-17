# xml.cr:9
require "xml"

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
