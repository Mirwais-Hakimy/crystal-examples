# json/from_json.cr:36
require "json"

Array(Int32).from_json("[1, 2, 3]") do |element|
  puts element
end
