# json/mapping.cr: 1 examples
require "json"

# json/mapping.cr:6 (001.cr)
require "json"

class Location
  JSON.mapping(
    lat: Float64,
    lng: Float64,
  )
end

class House
  JSON.mapping(
    address: String,
    location: {type: Location, nilable: true},
  )
end

house = House.from_json(%({"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}))
house.address  # => "Crystal Road 1234"
house.location # => #<Location:0x10cd93d80 @lat=12.3, @lng=34.5>
house.to_json  # => %({"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}})

houses = Array(House).from_json(%([{"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}]))
houses.size    # => 1
houses.to_json # => %([{"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}}])
