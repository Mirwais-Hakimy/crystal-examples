# http/common.cr:245
require "http/common"
HTTP.parse_time("Sun, 14 Feb 2016 21:00:00 GMT")  # => "2016-02-14 21:00:00 UTC"
HTTP.parse_time("Sunday, 14-Feb-16 21:00:00 GMT") # => "2016-02-14 21:00:00 UTC"
HTTP.parse_time("Sun Feb 14 21:00:00 2016")       # => "2016-02-14 21:00:00 UTC"
