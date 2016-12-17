require "spec"
require "yaml"
it "yaml/any.cr" do
puts # :nocode:

puts "# yaml/any.cr:5 (001.cr)" # :nocode: :example:
# require "yaml"

data = YAML.parse <<-END
         ---
         foo:
           bar:
             baz:
               - qux
               - fox
         END
( data["foo"]["bar"]["baz"][0].as_s ).to_s.should eq( "qux" )
( data["foo"]["bar"]["baz"].as_a ).should eq( ["qux", "fox"] )


end
