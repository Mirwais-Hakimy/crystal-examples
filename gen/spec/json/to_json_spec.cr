require "spec"
require "json"
puts "# json/to_json.cr:143 (001.cr)" # :nocode: :example:
# require "json"

class Person
  JSON.mapping({
    birth_date: {type: Time, converter: Time::EpochConverter},
  })
end

person = Person.from_json(%({"birth_date": 1459859781}))
( person.birth_date ).should eq( Time.parse("2016-04-05 12:36:21 UTC", "%F %T %z") )
( person.to_json ).should eq( %({"birth_date":1459859781}) )

puts "# json/to_json.cr:166 (002.cr)" # :nocode: :example:
# require "json"

class Timestamp
  JSON.mapping({
    value: {type: Time, converter: Time::EpochMillisConverter},
  })
end

timestamp = Timestamp.from_json(%({"value": 1459860483856}))
( timestamp.value ).should eq( Time.parse("2016-04-05 12:48:03.856 UTC", "%F %T.%L %z") )
( timestamp.to_json ).should eq( %({"value":1459860483856}) )

puts "# json/to_json.cr:192 (003.cr)" # :nocode: :example:
# require "json"

class Raw
  JSON.mapping({
    value: {type: String, converter: String::RawConverter},
  })
end

raw = Raw.from_json(%({"value": 123456789876543212345678987654321}))
( raw.value ).to_s.should eq( "123456789876543212345678987654321" )
( raw.to_json ).should eq( %({"value":123456789876543212345678987654321}) )

