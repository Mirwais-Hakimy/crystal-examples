# uri.cr:262
require "uri"
URI.escape("'Stop!' said Fred")                      # => "%27Stop%21%27%20said%20Fred"
URI.escape("'Stop!' said Fred", space_to_plus: true) # => "%27Stop%21%27+said+Fred"
