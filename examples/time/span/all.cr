# time/span.cr: 8 examples
require "time/span"

# time/span.cr:7 (001.cr)
# pending by 'file:pendings/time/span/001.cr'
# Time::Span.new(nanoseconds: 10_000) # => 00:00:00.000010000
# Time::Span.new(10, 10, 10)          # => 10:10:10
# Time::Span.new(10, 10, 10, 10)      # => 10.10:10:10

# time/span.cr:15 (002.cr)
span = Time.new(2015, 10, 10) - Time.new(2015, 9, 10)
span       # => 30.00:00:00
span.class # => Time::Span

# time/span.cr:23 (003.cr)
span = Time::Span.new(20, 10, 10)
span.hours   # => 20
span.minutes # => 10
span.seconds # => 10

# time/span.cr:32 (004.cr)
a = Time::Span.new(20, 10, 10)
b = Time::Span.new(10, 10, 10)
c = a - b # => 10:00:00
c.hours   # => 10

# time/span.cr:155 (005.cr)
(5.days + 25.hours).days # => 6_i64

# time/span.cr:200 (006.cr)
(4.weeks + 5.days + 6.hours).total_weeks # => 4.75

# time/span.cr:209 (007.cr)
(36.hours).total_days # => 1.5

# time/span.cr:543 (008.cr)
# pending by 'file:pendings/time/span/008.cr'
# Time.new(2016, 2, 1) + 13.months # => 2017-03-01 00:00:00
# Time.new(2016, 2, 29) + 2.years  # => 2018-02-28 00:00:00
