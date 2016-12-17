require "spec"

it "union.cr" do
puts # :nocode:

puts "# union.cr:14 (001.cr)" # :nocode: :example:
( Union(Int32 | String) ).should eq( (Int32 | String) )
( Union(Int32) ).should eq( Int32 )
( Union(Int32, Int32, Int32) ).should eq( Int32 )

puts "# union.cr:22 (002.cr)" # :nocode: :example:
( (Int32 | String).nilable? ).should eq( false )
( (Int32 | Nil).nilable? ).should eq( true )


end
