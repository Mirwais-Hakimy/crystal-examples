# time/span.cr:7
require "time/span"
Time::Span.new(nanoseconds: 10_000) # => 00:00:00.000010000
Time::Span.new(10, 10, 10)          # => 10:10:10
Time::Span.new(10, 10, 10, 10)      # => 10.10:10:10
