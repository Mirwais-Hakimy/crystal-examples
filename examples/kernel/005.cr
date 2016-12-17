# kernel.cr:233
sprintf "%o", 123   # => "173"
sprintf "%+o", 123  # => "+173"
sprintf "%o", -123  # => "-173"
sprintf "%+o", -123 # => "-173"
