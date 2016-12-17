require "spec"

puts "# enum.cr:5 (001.cr)" # :nocode: :example:
enum Color
  Red   # 0
  Green # 1
  Blue  # 2
end

puts "# enum.cr:17 (002.cr)" # :nocode: :example:
( Color::Green.value ).should eq( 1 )

puts "# enum.cr:23 (003.cr)" # :nocode: :example:
( typeof(Color::Red) ).should eq( Color )

puts "# enum.cr:31 (004.cr)" # :nocode: :example:
@[Flags]
enum IOMode
  Read  # 1
  Write # 2
  Async # 4
end

puts "# enum.cr:46 (005.cr)" # :nocode: :example:
( Color.new(1).to_s ).to_s.should eq( "Green" )

puts "# enum.cr:53 (006.cr)" # :nocode: :example:
( Color.new(10).to_s ).to_s.should eq( "10" )

puts "# enum.cr:68 (007.cr)" # :nocode: :example:
color = Color::Blue
( color.red? ).should eq( false )
( color.blue? ).should eq( true )

mode = IOMode::Read | IOMode::Async
( mode.read? ).should eq( true )
( mode.write? ).should eq( false )
( mode.async? ).should eq( true )

puts "# enum.cr:81 (008.cr)" # :nocode: :example:
case color
when .red?
  puts "Got red"
when .blue?
  puts "Got blue"
end

puts "# enum.cr:126 (009.cr)" # :nocode: :example:
( Color::Red.to_s ).to_s.should eq( "Red" )
( IOMode::None.to_s ).to_s.should eq( "None" )
( (IOMode::Read | IOMode::Write).to_s ).to_s.should eq( "Read | Write" )

( Color.new(10).to_s ).to_s.should eq( "10" )

puts "# enum.cr:150 (010.cr)" # :nocode: :example:
( Color::Blue.to_i ).should eq( 2 )
( (IOMode::Read | IOMode::Write).to_i ).should eq( 3 )

( Color.new(10).to_i ).should eq( 10 )

puts "# enum.cr:177 (011.cr)" # :nocode: :example:
( Color::Red + 1 ).should eq( Color::Green )
( Color::Red + 2 ).should eq( Color::Blue )
( Color::Red + 3 ).should eq( Color.new(3) )

puts "# enum.cr:189 (012.cr)" # :nocode: :example:
( Color::Blue - 1 ).should eq( Color::Green )
( Color::Blue - 2 ).should eq( Color::Red )
( Color::Blue - 3 ).should eq( Color.new(-1) )

puts "# enum.cr:202 (013.cr)" # :nocode: :example:
( (IOMode::Read | IOMode::Async) ).should eq( IOMode::Read | IOMode::Async )

puts "# enum.cr:213 (014.cr)" # :nocode: :example:
( (IOMode::Read | IOMode::Async) & IOMode::Read ).should eq( IOMode::Read )

puts "# enum.cr:236 (015.cr)" # :nocode: :example:
( Color::Red <=> Color::Blue ).should eq( -1 )
( Color::Blue <=> Color::Red ).should eq( 1 )
( Color::Blue <=> Color::Blue ).should eq( 0 )

puts "# enum.cr:254 (016.cr)" # :nocode: :example:
# pending by 'file:pendings/enum/016.cr' # :pending:
# (member & value) != 0

puts "# enum.cr:260 (017.cr)" # :nocode: :example:
# pending by 'file:pendings/enum/017.cr' # :pending:
# member.includes?(value)

puts "# enum.cr:268 (018.cr)" # :nocode: :example:
mode = IOMode::Read | IOMode::Write
( mode.includes?(IOMode::Read) ).should eq( true )
( mode.includes?(IOMode::Async) ).should eq( false )

puts "# enum.cr:279 (019.cr)" # :nocode: :example:
( Color::Red == Color::Red ).should eq( true )
( Color::Red == Color::Blue ).should eq( false )

puts "# enum.cr:294 (020.cr)" # :nocode: :example:
(IOMode::Read | IOMode::Async).each do |member, value|
  # yield IOMode::Read, 1
  # yield IOMode::Async, 3
end

puts "# enum.cr:317 (021.cr)" # :nocode: :example:
( Color.names ).should eq( ["Red", "Green", "Blue"] )

puts "# enum.cr:330 (022.cr)" # :nocode: :example:
( Color.values ).should eq( [Color::Red, Color::Green, Color::Blue] )

puts "# enum.cr:344 (023.cr)" # :nocode: :example:
( Color.from_value?(0) ).should eq( Color::Red )
( Color.from_value?(1) ).should eq( Color::Green )
( Color.from_value?(2) ).should eq( Color::Blue )
( Color.from_value?(3) ).should eq( nil )

puts "# enum.cr:368 (024.cr)" # :nocode: :example:
( Color.from_value(0) ).should eq( Color::Red )
( Color.from_value(1) ).should eq( Color::Green )
( Color.from_value(2) ).should eq( Color::Blue )
expect_raises(Exception) { Color.from_value(3) }

puts "# enum.cr:393 (025.cr)" # :nocode: :example:
( Color.parse("Red") ).should eq( Color::Red )
( Color.parse("BLUE") ).should eq( Color::Blue )
expect_raises(ArgumentError) { Color.parse("Yellow") }

puts "# enum.cr:409 (026.cr)" # :nocode: :example:
( Color.parse?("Red") ).should eq( Color::Red )
( Color.parse?("BLUE") ).should eq( Color::Blue )
( Color.parse?("Yellow") ).should eq( nil )

puts "# enum.cr:433 (027.cr)" # :nocode: :example:
( IOMode.flags(Read, Write) ).should eq( IOMode::Read | IOMode::Write )

puts "# enum.cr:445 (028.cr)" # :nocode: :example:
IOMode.each do |member, value|
  # yield IOMode::Read, 1
  # yield IOMode::Write, 2
  # yield IOMode::Async, 3
end

