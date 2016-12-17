require "spec"
require "base64"
it "base64.cr" do
puts # :nocode:

puts "# base64.cr:9 (001.cr)" # :nocode: :example:
# require "base64"

( enc = Base64.encode("Send reinforcements") ).to_s.should eq( "U2VuZCByZWluZm9yY2VtZW50cw==\n" )
( plain = Base64.decode_string(enc) ).to_s.should eq( "Send reinforcements" )

puts "# base64.cr:34 (002.cr)" # :nocode: :example:
puts Base64.encode("Now is the time for all good coders\nto learn Crystal")

puts "# base64.cr:58 (003.cr)" # :nocode: :example:
Base64.encode("Now is the time for all good coders\nto learn Crystal", STDOUT)

puts "# base64.cr:89 (004.cr)" # :nocode: :example:
puts Base64.strict_encode("Now is the time for all good coders\nto learn Crystal")

puts "# base64.cr:115 (005.cr)" # :nocode: :example:
Base64.strict_encode("Now is the time for all good coders\nto learn Crystal", STDOUT)


end
