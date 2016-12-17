# uri.cr:221
require "uri"
URI.unescape("%27Stop%21%27%20said%20Fred")                  # => "'Stop!' said Fred"
URI.unescape("%27Stop%21%27+said+Fred", plus_to_space: true) # => "'Stop!' said Fred"
