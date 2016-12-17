# time/span.cr:32
require "time/span"
a = Time::Span.new(20, 10, 10)
b = Time::Span.new(10, 10, 10)
c = a - b # => 10:00:00
c.hours   # => 10
