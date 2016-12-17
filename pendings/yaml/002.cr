# yaml.cr:35
require "yaml"

yaml = File.open("path/to/file.yml") do |file|
  YAML.parse(file)
end
