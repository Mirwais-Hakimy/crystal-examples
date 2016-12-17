# yaml/builder.cr:7
require "yaml"

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
string # => "---\nfoo:\n- 1\n- 2\nbar:\n  baz: qux\n"
