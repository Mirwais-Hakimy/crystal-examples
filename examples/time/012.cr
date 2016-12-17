# time.cr:159
Time.utc(2015, 10, 10) - 5.days # => 2015-10-05 00:00:00 +00:00

span = Time.utc(2015, 10, 10) - Time.utc(2015, 9, 10)
span.days          # => 30
span.total_hours   # => 720
span.total_minutes # => 43200
