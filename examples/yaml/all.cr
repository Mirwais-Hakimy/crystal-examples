# yaml.cr: 5 examples
require "yaml"

# yaml.cr:18 (001.cr)
require "yaml"

data = YAML.parse <<-END
         ---
         foo:
           bar:
             baz:
               - qux
               - fox
         END
data["foo"]["bar"]["baz"][1].as_s # => "fox"

# yaml.cr:35 (002.cr)
# pending by 'file:pendings/yaml/002.cr'
# require "yaml"
# 
# yaml = File.open("path/to/file.yml") do |file|
#   YAML.parse(file)
# end

# yaml.cr:69 (003.cr)
yaml = YAML.dump({hello: "world"})                               # => "---\nhello: world\n"
File.open("foo.yml", "w") { |f| YAML.dump({hello: "world"}, f) } # writes it to the file
# or:
yaml = {hello: "world"}.to_yaml                               # => "---\nhello: world\n"
File.open("foo.yml", "w") { |f| {hello: "world"}.to_yaml(f) } # writes it to the file

# yaml.cr:116 (004.cr)
require "yaml"

YAML.parse(File.read("./foo.yml"))
# => {
# => "data" => {
# => "string" => "foobar",
# => "array" => ["John", "Sarah"],
# => "hash" => {"key" => "value"},
# => "paragraph" => "foo\nbar\n"
# => }

# yaml.cr:141 (005.cr)
require "yaml"

YAML.parse_all(File.read("./foo.yml"))
# => [{"foo" => "bar"}, {"hello" => "world"}]
