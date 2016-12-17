# http/common.cr: 6 examples
require "http/common"

# http/common.cr:85 (001.cr)
line = "Server: nginx"
name, value = line.split ':', 2
{name, value.lstrip} # => {"Server", "nginx"}

# http/common.cr:245 (002.cr)
HTTP.parse_time("Sun, 14 Feb 2016 21:00:00 GMT")  # => "2016-02-14 21:00:00 UTC"
HTTP.parse_time("Sunday, 14-Feb-16 21:00:00 GMT") # => "2016-02-14 21:00:00 UTC"
HTTP.parse_time("Sun Feb 14 21:00:00 2016")       # => "2016-02-14 21:00:00 UTC"

# http/common.cr:263 (003.cr)
HTTP.format_time(Time.utc(2016, 2, 15)) # => "Mon, 15 Feb 2016 00:00:00 GMT"

# http/common.cr:275 (004.cr)
quoted = %q(\"foo\\bar\")
HTTP.dequote_string(quoted) # => %q("foo\bar")

# http/common.cr:300 (005.cr)
string = %q("foo\ bar")
io = IO::Memory.new
HTTP.quote_string(string, io)
io.rewind
io.gets_to_end # => %q(\"foo\\\ bar\")

# http/common.cr:324 (006.cr)
string = %q("foo\ bar")
HTTP.quote_string(string) # => %q(\"foo\\\ bar\")
