# time.cr:181
t1 = Time.utc_now
# operation that takes 1 minute
t2 = Time.utc_now
t2 - t1 # => ?
