# time/span.cr:15
require "time/span"
span = Time.new(2015, 10, 10) - Time.new(2015, 9, 10)
span       # => 30.00:00:00
span.class # => Time::Span
