# xml/node.cr:519
require "xml"
nodes = doc.xpath_nodes("//person")
nodes.class       # => XML::NodeSet
nodes.map(&.name) # => ["person"]
