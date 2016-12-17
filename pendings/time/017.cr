# time.cr:301
start = Time.monotonic
# operation that takes 20 milliseconds
elapsed = Time.monotonic - start # => 20.milliseconds (approximately)
# operation that takes 50 milliseconds
elapsed_total = Time.monotonic - start # => 70.milliseconds (approximately)
