# xml/node.cr:531
require "xml"
doc.xpath_node("//person")  # => #<XML::Node:0x2013e80 name="person">
doc.xpath_node("//invalid") # => nil
