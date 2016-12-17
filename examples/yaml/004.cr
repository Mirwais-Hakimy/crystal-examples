# yaml.cr:116
require "yaml"

YAML.parse(File.read("./foo.yml"))
# => {
# => "data" => {
# => "string" => "foobar",
# => "array" => ["John", "Sarah"],
# => "hash" => {"key" => "value"},
# => "paragraph" => "foo\nbar\n"
# => }
