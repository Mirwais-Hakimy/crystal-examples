# json/to_json.cr:143
require "json"

class Person
  JSON.mapping({
    birth_date: {type: Time, converter: Time::EpochConverter},
  })
end

person = Person.from_json(%({"birth_date": 1459859781}))
person.birth_date # => 2016-04-05 12:36:21 UTC
person.to_json    # => %({"birth_date":1459859781})
