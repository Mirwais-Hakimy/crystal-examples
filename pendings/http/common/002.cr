# http/common.cr:238
require "http/common"
HTTP.rfc1123_date(Time.new(2016, 2, 15)) # => "Sun, 14 Feb 2016 21:00:00 GMT"
