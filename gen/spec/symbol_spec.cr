require "spec"

it "symbol.cr" do
puts # :nocode:

puts "# symbol.cr:4 (001.cr)" # :nocode: :example:
:hello
:welcome
:"123"
:"symbol with spaces"

puts "# symbol.cr:34 (002.cr)" # :nocode: :example:
( :crystal.inspect ).to_s.should eq( ":crystal" )

puts "# symbol.cr:50 (003.cr)" # :nocode: :example:
( :crystal.to_s ).to_s.should eq( "crystal" )

puts "# symbol.cr:59 (004.cr)" # :nocode: :example:
( Symbol.needs_quotes? "string" ).should eq( false )
( Symbol.needs_quotes? "long string" ).should eq( true )


end
