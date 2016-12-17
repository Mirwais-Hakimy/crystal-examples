# http/common.cr:275
require "http/common"
quoted = %q(\"foo\\bar\")
HTTP.dequote_string(quoted) # => %q("foo\bar")
