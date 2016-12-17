# json/any.cr: 1 examples
require "json"

# json/any.cr:4 (001.cr)
obj = JSON.parse(%({"access": [{"name": "mapping", "speed": "fast"}, {"name": "any", "speed": "slow"}]}))
obj["access"][1]["name"].as_s  # => "any"
obj["access"][1]["speed"].as_s # => "slow"
