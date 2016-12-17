# json/to_json.cr:192
require "json"

class Raw
  JSON.mapping({
    value: {type: String, converter: String::RawConverter},
  })
end

raw = Raw.from_json(%({"value": 123456789876543212345678987654321}))
raw.value   # => "123456789876543212345678987654321"
raw.to_json # => %({"value":123456789876543212345678987654321})
