# yaml/serialization.cr:9
require "yaml"

class Location
  include YAML::Serializable

  @[YAML::Field(key: "lat")]
  property latitude : Float64

  @[YAML::Field(key: "lng")]
  property longitude : Float64
end

class House
  include YAML::Serializable
  property address : String
  property location : Location?
end

house = House.from_yaml(%({"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}))
house.address  # => "Crystal Road 1234"
house.location # => #<Location:0x10cd93d80 @latitude=12.3, @longitude=34.5>
house.to_yaml  # => "---\naddress: Crystal Road 1234\nlocation:\n  lat: 12.3\n  lng: 34.5\n"

houses = Array(House).from_yaml("---\n- address: Crystal Road 1234\n  location:\n    lat: 12.3\n    lng: 34.5\n")
houses.size    # => 1
houses.to_yaml # => "---\n- address: Crystal Road 1234\n  location:\n    lat: 12.3\n    lng: 34.5\n"
