require "spec"
require "csv"
it "csv.cr" do
puts # :nocode:

puts "# csv.cr:33 (001.cr)" # :nocode: :example:
# require "csv"

csv = CSV.new("Name, Age\nJohn, 20\nPeter, 30", headers: true)
( csv.next ).should eq( true )

( csv["Name"] ).to_s.should eq( "John" )
( csv[0] ).to_s.should eq( "John" )
( csv[-2] ).to_s.should eq( "John" )
( csv[/name/i] ).to_s.should eq( "John" )

( csv["Age"] ).to_s.should eq( " 20" )

( csv.row.to_a ).should eq( ["John", " 20"] )
( csv.row.to_h ).should eq( {"Name" => "John", "Age" => " 20"} )

( csv.next ).should eq( true )
( csv["Name"] ).to_s.should eq( "Peter" )

( csv.next ).should eq( false )

puts "# csv.cr:67 (002.cr)" # :nocode: :example:
CSV.parse("one,two\nthree")
# => [["one", "two"], ["three"]]
CSV.parse("one;two\n'three;'", separator: ';', quote_char: '\'')
# => [["one", "two"], ["three;"]]

puts "# csv.cr:81 (003.cr)" # :nocode: :example:
CSV.each_row("one,two\nthree") do |row|
  puts row
end

puts "# csv.cr:89 (004.cr)" # :nocode: :example:
["one", "two"]
["three"]

puts "# csv.cr:103 (005.cr)" # :nocode: :example:
rows = CSV.each_row("one,two\nthree")
( rows.next ).should eq( ["one", "two"] )
( rows.next ).should eq( ["three"] )

puts "# csv.cr:116 (006.cr)" # :nocode: :example:
result = CSV.build do |csv|
  csv.row "one", "two"
  csv.row "three"
end
( result ).to_s.should eq( "one,two\nthree\n" )
result = CSV.build(quoting: CSV::Builder::Quoting::ALL) do |csv|
  csv.row "one", "two"
  csv.row "three"
end
( result ).to_s.should eq( "\"one\",\"two\"\n\"three\"\n" )

puts "# csv.cr:139 (007.cr)" # :nocode: :example:
io = IO::Memory.new
io.puts "HEADER"
CSV.build(io) do |csv|
  csv.row "one", "two"
  csv.row "three"
end
( io.to_s ).to_s.should eq( "HEADER\none,two\nthree\n" )


end
