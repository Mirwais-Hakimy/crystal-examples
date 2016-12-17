# http/common.cr:300
require "http/common"
string = %q("foo\ bar")
io = IO::Memory.new
HTTP.quote_string(string, io)
io.rewind
io.gets_to_end # => %q(\"foo\\\ bar\")
