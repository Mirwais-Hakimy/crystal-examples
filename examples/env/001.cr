# env.cr:7
# Set env var PORT to a default if not already set
ENV["PORT"] ||= "5000"
# Later use that env var.
puts ENV["PORT"].to_i
