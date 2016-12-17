# json.cr:32
require "json"

json = File.open("path/to/file.json") do |file|
  JSON.parse(file)
end
