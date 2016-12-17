# yaml/builder.cr:189
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
