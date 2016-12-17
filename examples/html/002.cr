# html.cr:30
require "html"
io = IO::Memory.new
HTML.escape("Crystal & You", io) # => nil
io.to_s                          # => "Crystal &amp; You"
