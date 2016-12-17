# xml/node.cr:498
require "xml"
doc = XML.parse("<person></person>")

doc.xpath_bool("count(//person) > 0") # => true
