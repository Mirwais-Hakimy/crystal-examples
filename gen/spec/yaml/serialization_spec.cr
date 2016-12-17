require "spec"
require "yaml"
puts "# yaml/serialization.cr:9 (001.cr)" # :nocode: :example:
# require "yaml"

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
( house.address ).to_s.should eq( "Crystal Road 1234" )
( house.location ).class.to_s.should eq( "Location" )
( house.to_yaml ).to_s.should eq( "---\naddress: Crystal Road 1234\nlocation:\n  lat: 12.3\n  lng: 34.5\n" )

houses = Array(House).from_yaml("---\n- address: Crystal Road 1234\n  location:\n    lat: 12.3\n    lng: 34.5\n")
( houses.size ).should eq( 1 )
( houses.to_yaml ).to_s.should eq( "---\n- address: Crystal Road 1234\n  location:\n    lat: 12.3\n    lng: 34.5\n" )

puts "# yaml/serialization.cr:50 (002.cr)" # :nocode: :example:
class A
  include YAML::Serializable

  @[YAML::Field(key: "my_key", emit_null: true)]
  getter a : Int32?
end

puts "# yaml/serialization.cr:67 (003.cr)" # :nocode: :example:
# pending by 'file:pendings/yaml/serialization/003.cr' # :pending:
# struct A
#   include YAML::Serializable
#   @a : Int32
#   @b : Float64 = 1.0
# end
# 
# A.from_yaml("---\na: 1\n") # => A(@a=1, @b=1.0)

puts "# yaml/serialization.cr:85 (004.cr)" # :nocode: :example:
# pending by 'file:pendings/yaml/serialization/004.cr' # :pending:
# struct A
#   include YAML::Serializable
#   include YAML::Serializable::Unmapped
#   @a : Int32
# end
# 
# a = A.from_yaml("---\na: 1\nb: 2\n") # => A(@yaml_unmapped={"b" => 2_i64}, @a=1)
# a.to_yaml                            # => "---\na: 1\nb: 2\n"

puts "# yaml/serialization.cr:102 (005.cr)" # :nocode: :example:
@[YAML::Serializable::Options(emit_nulls: true)]
class A
  include YAML::Serializable
  @a : Int32?
end

