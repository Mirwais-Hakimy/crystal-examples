# yaml.cr:69
require "yaml"
yaml = YAML.dump({hello: "world"})                               # => "---\nhello: world\n"
File.open("foo.yml", "w") { |f| YAML.dump({hello: "world"}, f) } # writes it to the file
# or:
yaml = {hello: "world"}.to_yaml                               # => "---\nhello: world\n"
File.open("foo.yml", "w") { |f| {hello: "world"}.to_yaml(f) } # writes it to the file
