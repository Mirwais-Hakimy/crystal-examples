require "spec"
require "big"
it "big/big_float.cr" do
puts # :nocode:

puts "# big/big_float.cr:339 (001.cr)" # :nocode: :example:
# require "big"
"1234.0".to_big_f

puts "# big/big_float.cr:363 (002.cr)" # :nocode: :example:
# require "big"
Math.sqrt((1000_000_000_0000.to_big_f*1000_000_000_00000.to_big_f))


end
