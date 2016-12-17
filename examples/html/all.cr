# html.cr: 3 examples
require "html"

# html.cr:18 (001.cr)
require "html"

HTML.escape("Crystal & You") # => "Crystal &amp; You"

# html.cr:30 (002.cr)
io = IO::Memory.new
HTML.escape("Crystal & You", io) # => nil
io.to_s                          # => "Crystal &amp; You"

# html.cr:86 (003.cr)
HTML.unescape("Crystal &amp; You") # => "Crystal & You"
