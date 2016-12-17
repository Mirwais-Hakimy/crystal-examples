# tempfile.cr:38
require "tempfile"
Tempfile.new("foo", ".png").path # => "/tmp/foo.ulBCPS.png"
