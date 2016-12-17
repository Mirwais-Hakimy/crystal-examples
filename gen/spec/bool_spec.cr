require "spec"

it "bool.cr" do
puts # :nocode:

puts "# bool.cr:3 (001.cr)" # :nocode: :example:
true  # A Bool that is true
false # A Bool that is false

puts "# bool.cr:10 (002.cr)" # :nocode: :example:
( false | false ).should eq( false )
( false | true ).should eq( true )
( true | false ).should eq( true )
( true | true ).should eq( true )

puts "# bool.cr:22 (003.cr)" # :nocode: :example:
( false & false ).should eq( false )
( false & true ).should eq( false )
( true & false ).should eq( false )
( true & true ).should eq( true )

puts "# bool.cr:34 (004.cr)" # :nocode: :example:
( false ^ false ).should eq( false )
( false ^ true ).should eq( true )
( true ^ false ).should eq( true )
( true ^ true ).should eq( false )


end
