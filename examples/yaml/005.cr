# yaml.cr:141
require "yaml"

YAML.parse_all(File.read("./foo.yml"))
# => [{"foo" => "bar"}, {"hello" => "world"}]
