require "spec"
require "levenshtein"
it "levenshtein.cr" do
puts # :nocode:

puts "# levenshtein.cr:5 (001.cr)" # :nocode: :example:
# require "levenshtein"

( Levenshtein.distance("algorithm", "altruistic") ).should eq( 6 )
( Levenshtein.distance("hello", "hallo") ).should eq( 1 )
( Levenshtein.distance("こんにちは", "こんちは") ).should eq( 1 )
( Levenshtein.distance("hey", "hey") ).should eq( 0 )

puts "# levenshtein.cr:50 (002.cr)" # :nocode: :example:
finder = Levenshtein::Finder.new "hallo"
finder.test "hay"
finder.test "hall"
finder.test "hallo world"

( finder.best_match ).to_s.should eq( "hall" )


end
