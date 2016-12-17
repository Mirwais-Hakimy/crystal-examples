require "spec"
require "range/bsearch"
it "range/bsearch.cr" do
puts # :nocode:

puts "# range/bsearch.cr:78 (001.cr)" # :nocode: :example:
( (0..10).bsearch { |x| x >= 5 } ).should eq( 5 )
( (0..Float64::INFINITY).bsearch { |x| x ** 4 >= 256 } ).should eq( 4 )


end
