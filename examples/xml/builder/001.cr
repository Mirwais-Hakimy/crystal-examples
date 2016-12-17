# xml/builder.cr:291
require "xml"

string = XML.build(indent: "  ") do |xml|
  xml.element("person", id: 1) do
    xml.element("firstname") { xml.text "Jane" }
    xml.element("lastname") { xml.text "Doe" }
  end
end

string # => "<?xml version=\"1.0\"?>\n<person id=\"1\">\n  <firstname>Jane</firstname>\n  <lastname>Doe</lastname>\n</person>\n"
