require "spec"
require "random/secure"
it "random/secure.cr" do
puts # :nocode:

puts "# random/secure.cr:9 (001.cr)" # :nocode: :example:
( Random::Secure.rand(6) ).should eq( 4 )
( [1, 5, 6].shuffle(Random::Secure) ).should eq( [6, 1, 5] )


end
