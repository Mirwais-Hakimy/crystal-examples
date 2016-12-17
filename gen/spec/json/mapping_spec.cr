require "spec"
require "json"
puts "# json/mapping.cr:6 (001.cr)" # :nocode: :example:
# require "json"

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
( house.address ).to_s.should eq( "Crystal Road 1234" )
( house.location ).class.to_s.should eq( "Location" )
( house.to_json ).should eq( %({"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}}) )

houses = Array(House).from_json(%([{"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}]))
( houses.size ).should eq( 1 )
( houses.to_json ).should eq( %([{"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}}]) )

