# tempfile.cr:23
require "tempfile"
Tempfile.new("foo").path # => "/tmp/foo.ulBCPS"
