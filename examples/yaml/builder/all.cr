# yaml/builder.cr: 2 examples
require "yaml"

# yaml/builder.cr:7 (001.cr)
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

# yaml/builder.cr:189 (002.cr)
require "yaml"

string = YAML.build do |yaml|
  yaml.mapping do
    yaml.scalar "foo"
    yaml.sequence do
      yaml.scalar 1
      yaml.scalar 2
    end
  end
end
string # => "---\nfoo:\n- 1\n- 2\n"
