# time.cr:1165
time = Time.utc(2016, 1, 12, 3, 4, 5, nanosecond: 678_000_000)
time.to_unix_ms # => 1452567845678
