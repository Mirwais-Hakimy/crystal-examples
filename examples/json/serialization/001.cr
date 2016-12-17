# json/serialization.cr:9
require "json"

class Location
  include JSON::Serializable

  @[JSON::Field(key: "lat")]
  property latitude : Float64

  @[JSON::Field(key: "lng")]
  property longitude : Float64
end

class House
  include JSON::Serializable
  property address : String
  property location : Location?
end

house = House.from_json(%({"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}))
house.address  # => "Crystal Road 1234"
house.location # => #<Location:0x10cd93d80 @latitude=12.3, @longitude=34.5>
house.to_json  # => %({"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}})

houses = Array(House).from_json(%([{"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}]))
houses.size    # => 1
houses.to_json # => %([{"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}}])
