# colorize.cr:52
require "colorize"
"foo".colorize(:red).toggle(false)              # => "foo" without color
"foo".colorize(:red).toggle(false).toggle(true) # => "foo" in red
