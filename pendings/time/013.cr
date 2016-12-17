# time.cr:185
t1 = Time.monotonic
# operation that takes 1 minute
t2 = Time.monotonic
t2 - t1 # => 1.minute (approximately)
