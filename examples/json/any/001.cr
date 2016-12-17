# json/any.cr:4
require "json"
obj = JSON.parse(%({"access": [{"name": "mapping", "speed": "fast"}, {"name": "any", "speed": "slow"}]}))
obj["access"][1]["name"].as_s  # => "any"
obj["access"][1]["speed"].as_s # => "slow"
