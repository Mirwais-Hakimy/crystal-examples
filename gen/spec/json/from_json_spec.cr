require "spec"
require "json"
it "json/from_json.cr" do
puts # :nocode:

puts "# json/from_json.cr:7 (001.cr)" # :nocode: :example:
( Int32.from_json("1") ).should eq( 1 )
( Array(Int32).from_json("[1, 2, 3]") ).should eq( [1, 2, 3] )

puts "# json/from_json.cr:21 (002.cr)" # :nocode: :example:
( Int32.from_json(%({"main": 1}), root: "main") ).should eq( 1 )

puts "# json/from_json.cr:36 (003.cr)" # :nocode: :example:
# require "json"

Array(Int32).from_json("[1, 2, 3]") do |element|
  puts element
end


end
