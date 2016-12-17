require "spec"
require "crypto/subtle"
it "crypto/subtle.cr" do
puts # :nocode:

puts "# crypto/subtle.cr:4 (001.cr)" # :nocode: :example:
# require "crypto/subtle"

( Crypto::Subtle.constant_time_compare("foo", "bar") ).should eq( false )
( Crypto::Subtle.constant_time_compare("foo", "foo") ).should eq( true )


end
