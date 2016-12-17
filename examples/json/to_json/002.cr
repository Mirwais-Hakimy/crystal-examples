# json/to_json.cr:166
require "json"

class Timestamp
  JSON.mapping({
    value: {type: Time, converter: Time::EpochMillisConverter},
  })
end

timestamp = Timestamp.from_json(%({"value": 1459860483856}))
timestamp.value   # => 2016-04-05 12:48:03.856 UTC
timestamp.to_json # => %({"value":1459860483856})
