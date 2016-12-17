# xml/node.cr: 5 examples
require "xml"

# xml/node.cr:498 (001.cr)
require "xml"
doc = XML.parse("<person></person>")

doc.xpath_bool("count(//person) > 0") # => true

# xml/node.cr:510 (002.cr)
doc.xpath_float("count(//person)") # => 1.0

# xml/node.cr:519 (003.cr)
nodes = doc.xpath_nodes("//person")
nodes.class       # => XML::NodeSet
nodes.map(&.name) # => ["person"]

# xml/node.cr:531 (004.cr)
doc.xpath_node("//person")  # => #<XML::Node:0x2013e80 name="person">
doc.xpath_node("//invalid") # => nil

# xml/node.cr:541 (005.cr)
doc.xpath_string("string(/persons/person[1])")
