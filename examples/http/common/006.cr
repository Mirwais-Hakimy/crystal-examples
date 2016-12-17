# http/common.cr:324
require "http/common"
string = %q("foo\ bar")
HTTP.quote_string(string) # => %q(\"foo\\\ bar\")
