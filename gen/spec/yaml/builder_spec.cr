require "spec"
require "yaml"
it "yaml/builder.cr" do
puts # :nocode:

puts "# yaml/builder.cr:7 (001.cr)" # :nocode: :example:
# require "yaml"

string = YAML.build do |yaml|
  yaml.mapping do
    yaml.scalar "foo"
    yaml.sequence do
      yaml.scalar 1
      yaml.scalar 2
    end
    yaml.scalar "bar"
    yaml.mapping do
      yaml.scalar "baz"
      yaml.scalar "qux"
    end
  end
end
( string ).to_s.should eq( "---\nfoo:\n- 1\n- 2\nbar:\n  baz: qux\n" )

puts "# yaml/builder.cr:189 (002.cr)" # :nocode: :example:
# require "yaml"

string = YAML.build do |yaml|
  yaml.mapping do
    yaml.scalar "foo"
    yaml.sequence do
      yaml.scalar 1
      yaml.scalar 2
    end
  end
end
( string ).to_s.should eq( "---\nfoo:\n- 1\n- 2\n" )


end
