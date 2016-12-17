require "spec"

it "nil.cr" do
puts # :nocode:

puts "# nil.cr:7 (001.cr)" # :nocode: :example:
str = "Hello world"
( str.index 'e' ).should eq( 1 )
( str.index 'a' ).should eq( nil )

puts "# nil.cr:16 (002.cr)" # :nocode: :example:
str = "Hello world"
idx = str.index 'e'
# idx + 1 # Error: undefined method '+' for Nil

puts "# nil.cr:25 (003.cr)" # :nocode: :example:
str = "Hello world"

# The index of 'e' in str or 0 if not found
idx1 = str.index('e') || 0

idx2 = str.index('a')
if idx2
  # Compiles: idx2 can't be nil here
  idx2 + 1
end

# Tell the compiler that we are sure the returned
# # value is not nil: raises a runtime exception
# if our assumption doesn't hold.
idx3 = str.index('o').not_nil!


end
