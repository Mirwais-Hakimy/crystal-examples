require "spec"
require "math/math"
it "math/math.cr" do
puts # :nocode:

puts "# math/math.cr:70 (001.cr)" # :nocode: :example:
Math.lgamma(2.96)

puts "# math/math.cr:74 (002.cr)" # :nocode: :example:
Math.log(Math.gamma(2.96).abs)

puts "# math/math.cr:215 (003.cr)" # :nocode: :example:
( Math.pw2ceil(33) ).should eq( 64 )


end
