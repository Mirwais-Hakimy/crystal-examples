require "spec"
require "time/span"
it "time/span.cr" do
puts # :nocode:

puts "# time/span.cr:7 (001.cr)" # :nocode: :example:
# pending by 'file:pendings/time/span/001.cr' # :pending:
# Time::Span.new(nanoseconds: 10_000) # => 00:00:00.000010000
# Time::Span.new(10, 10, 10)          # => 10:10:10
# Time::Span.new(10, 10, 10, 10)      # => 10.10:10:10

puts "# time/span.cr:15 (002.cr)" # :nocode: :example:
span = Time.new(2015, 10, 10) - Time.new(2015, 9, 10)
( span ).should eq( Time::Span.new(30, 0, 0, 0, 0) )
( span.class ).should eq( Time::Span )

puts "# time/span.cr:23 (003.cr)" # :nocode: :example:
span = Time::Span.new(20, 10, 10)
( span.hours ).should eq( 20 )
( span.minutes ).should eq( 10 )
( span.seconds ).should eq( 10 )

puts "# time/span.cr:32 (004.cr)" # :nocode: :example:
a = Time::Span.new(20, 10, 10)
b = Time::Span.new(10, 10, 10)
( c = a - b ).should eq( Time::Span.new(0, 10, 0, 0, 0) )
( c.hours ).should eq( 10 )

puts "# time/span.cr:155 (005.cr)" # :nocode: :example:
( (5.days + 25.hours).days ).should eq( 6_i64 )

puts "# time/span.cr:200 (006.cr)" # :nocode: :example:
( (4.weeks + 5.days + 6.hours).total_weeks ).try(&.to_f).to_s.should eq( "4.75" )

puts "# time/span.cr:209 (007.cr)" # :nocode: :example:
( (36.hours).total_days ).try(&.to_f).to_s.should eq( "1.5" )

puts "# time/span.cr:543 (008.cr)" # :nocode: :example:
# pending by 'file:pendings/time/span/008.cr' # :pending:
# Time.new(2016, 2, 1) + 13.months # => 2017-03-01 00:00:00
# Time.new(2016, 2, 29) + 2.years  # => 2018-02-28 00:00:00


end
