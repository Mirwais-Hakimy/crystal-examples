require "spec"
require "json"
it "json/any.cr" do
puts # :nocode:

puts "# json/any.cr:4 (001.cr)" # :nocode: :example:
obj = JSON.parse(%({"access": [{"name": "mapping", "speed": "fast"}, {"name": "any", "speed": "slow"}]}))
( obj["access"][1]["name"].as_s ).to_s.should eq( "any" )
( obj["access"][1]["speed"].as_s ).to_s.should eq( "slow" )


end
