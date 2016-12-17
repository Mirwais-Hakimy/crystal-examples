require "spec"
require "json"
puts "# json/serialization.cr:9 (001.cr)" # :nocode: :example:
# require "json"

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
( house.address ).to_s.should eq( "Crystal Road 1234" )
( house.location ).class.to_s.should eq( "Location" )
( house.to_json ).should eq( %({"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}}) )

houses = Array(House).from_json(%([{"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}]))
( houses.size ).should eq( 1 )
( houses.to_json ).should eq( %([{"address":"Crystal Road 1234","location":{"lat":12.3,"lng":34.5}}]) )

puts "# json/serialization.cr:50 (002.cr)" # :nocode: :example:
class A
  include JSON::Serializable

  @[JSON::Field(key: "my_key", emit_null: true)]
  getter a : Int32?
end

puts "# json/serialization.cr:68 (003.cr)" # :nocode: :example:
# pending by 'file:pendings/json/serialization/003.cr' # :pending:
# struct A
#   include JSON::Serializable
#   @a : Int32
#   @b : Float64 = 1.0
# end
# 
# A.from_json(%<{"a":1}>) # => A(@a=1, @b=1.0)

puts "# json/serialization.cr:86 (004.cr)" # :nocode: :example:
# pending by 'file:pendings/json/serialization/004.cr' # :pending:
# struct A
#   include JSON::Serializable
#   include JSON::Serializable::Unmapped
#   @a : Int32
# end
# 
# a = A.from_json(%({"a":1,"b":2})) # => A(@json_unmapped={"b" => 2_i64}, @a=1)
# a.to_json                         # => {"a":1,"b":2}

puts "# json/serialization.cr:103 (005.cr)" # :nocode: :example:
@[JSON::Serializable::Options(emit_nulls: true)]
class A
  include JSON::Serializable
  @a : Int32?
end

