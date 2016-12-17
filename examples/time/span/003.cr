# time/span.cr:23
require "time/span"
span = Time::Span.new(20, 10, 10)
span.hours   # => 20
span.minutes # => 10
span.seconds # => 10
