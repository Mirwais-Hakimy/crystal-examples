# time/span.cr:543
require "time/span"
Time.new(2016, 2, 1) + 13.months # => 2017-03-01 00:00:00
Time.new(2016, 2, 29) + 2.years  # => 2018-02-28 00:00:00
