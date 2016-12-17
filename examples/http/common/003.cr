# http/common.cr:263
require "http/common"
HTTP.format_time(Time.utc(2016, 2, 15)) # => "Mon, 15 Feb 2016 00:00:00 GMT"
