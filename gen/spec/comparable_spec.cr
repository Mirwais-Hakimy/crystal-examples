require "spec"

it "comparable.cr" do
puts # :nocode:

puts "# comparable.cr:49 (001.cr)" # :nocode: :example:
# Sort in a descending way
( [4, 7, 2].sort { |x, y| y <=> x } ).should eq( [7, 4, 2] )


end
