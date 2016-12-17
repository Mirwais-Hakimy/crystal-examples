require "spec"
require "openssl"
it "openssl/x509/name.cr" do
puts # :nocode:

puts "# openssl/x509/name.cr:10 (001.cr)" # :nocode: :example:
# require "openssl"

OpenSSL::X509::Name.parse("CN=nobody/DC=example")

puts "# openssl/x509/name.cr:49 (002.cr)" # :nocode: :example:
name = OpenSSL::X509::Name.new
name.add_entry "CN", "Nobody"
name.add_entry "DC", "example"

puts "# openssl/x509/name.cr:63 (003.cr)" # :nocode: :example:
name = OpenSSL::X509::Name.parse("CN=Nobody/DC=example")
( name.to_a ).should eq( [{"CN", "Nobody"}, {"DC", "example"}] )


end
