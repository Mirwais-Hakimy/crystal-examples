# json/to_json.cr: 3 examples
require "json"

# json/to_json.cr:143 (001.cr)
require "json"

class Person
  JSON.mapping({
    birth_date: {type: Time, converter: Time::EpochConverter},
  })
end

person = Person.from_json(%({"birth_date": 1459859781}))
person.birth_date # => 2016-04-05 12:36:21 UTC
person.to_json    # => %({"birth_date":1459859781})

# json/to_json.cr:166 (002.cr)
require "json"

class Timestamp
  JSON.mapping({
    value: {type: Time, converter: Time::EpochMillisConverter},
  })
end

timestamp = Timestamp.from_json(%({"value": 1459860483856}))
timestamp.value   # => 2016-04-05 12:48:03.856 UTC
timestamp.to_json # => %({"value":1459860483856})

# json/to_json.cr:192 (003.cr)
require "json"

class Raw
  JSON.mapping({
    value: {type: String, converter: String::RawConverter},
  })
end

raw = Raw.from_json(%({"value": 123456789876543212345678987654321}))
raw.value   # => "123456789876543212345678987654321"
raw.to_json # => %({"value":123456789876543212345678987654321})
