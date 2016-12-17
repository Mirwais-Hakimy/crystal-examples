# time.cr:42
Time.new(2015, 10, 10) - 5.days # => 2015-10-05 00:00:00 +01:00

# Time calculation returns a Time::Span instance
span = Time.new(2015, 10, 10) - Time.new(2015, 9, 10)
span.days          # => 30
span.total_hours   # => 720
span.total_minutes # => 43200

# Calculation between Time::Span instances
span_a = Time::Span.new(3, 0, 0)
span_b = Time::Span.new(2, 0, 0)
span = span_a - span_b
span       # => 01:00:00
span.class # => Time::Span
span.hours # => 1
