# time.cr:194
elapsed_time = Time.measure do
  # operation that takes 20 milliseconds
end
elapsed_time # => 20.milliseconds (approximately)
