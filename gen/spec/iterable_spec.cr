require "spec"

it "iterable.cr" do
puts # :nocode:

puts "# iterable.cr:20 (001.cr)" # :nocode: :example:
( (0..7).chunk(&./(3)).to_a ).should eq( [{0, [0, 1, 2]}, {1, [3, 4, 5]}, {2, [6, 7]}] )


end
