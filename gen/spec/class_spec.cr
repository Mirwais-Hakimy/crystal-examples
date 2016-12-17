require "spec"

it "class.cr" do
puts # :nocode:

puts "# class.cr:13 (001.cr)" # :nocode: :example:
( Int32 == Int32 ).should eq( true )
( Int32 == String ).should eq( false )

puts "# class.cr:23 (002.cr)" # :nocode: :example:
( Int32 < Number ).should eq( true )
( Int32 < Value ).should eq( true )
( Int32 < Int32 ).should eq( false )
( Int32 <= String ).should eq( false )

puts "# class.cr:38 (003.cr)" # :nocode: :example:
( Int32 < Number ).should eq( true )
( Int32 < Value ).should eq( true )
( Int32 <= Int32 ).should eq( true )
( Int32 <= String ).should eq( false )

puts "# class.cr:52 (004.cr)" # :nocode: :example:
( Number > Int32 ).should eq( true )
( Number > Number ).should eq( false )
( Number > Object ).should eq( false )

puts "# class.cr:66 (005.cr)" # :nocode: :example:
( Number >= Int32 ).should eq( true )
( Number >= Number ).should eq( true )
( Number >= Object ).should eq( false )

puts "# class.cr:103 (006.cr)" # :nocode: :example:
( String.name ).to_s.should eq( "String" )

puts "# class.cr:117 (007.cr)" # :nocode: :example:
klass = Int32
number = [99, "str"][0]
( typeof(number) ).should eq( (String | Int32) )
( typeof(klass.cast(number)) ).should eq( Int32 )

puts "# class.cr:129 (008.cr)" # :nocode: :example:
( Int32 | Char ).should eq( (Int32 | Char) )

puts "# class.cr:140 (009.cr)" # :nocode: :example:
( Int32.nilable? ).should eq( false )
( Nil.nilable? ).should eq( true )


end
