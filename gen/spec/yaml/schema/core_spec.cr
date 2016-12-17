require "spec"
require "yaml"
it "yaml/schema/core.cr" do
puts # :nocode:

puts "# yaml/schema/core.cr:58 (001.cr)" # :nocode: :example:
# pending by 'file:pendings/yaml/schema/core/001.cr' # :pending:
# YAML::Schema::Core.parse_scalar("hello") # => "hello"
# YAML::Schema::Core.parse_scalar("1.2")   # => 1.2
# YAML::Schema::Core.parse_scalar("false") # => false

puts "# yaml/schema/core.cr:110 (002.cr)" # :nocode: :example:
( YAML::Schema::Core.reserved_string?("hello") ).should eq( false )
( YAML::Schema::Core.reserved_string?("1.2") ).should eq( true )
( YAML::Schema::Core.reserved_string?("false") ).should eq( true )


end
