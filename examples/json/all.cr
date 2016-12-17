# json.cr: 3 examples
require "json"

# json.cr:15 (001.cr)
require "json"

value = JSON.parse("[1, 2, 3]") # : JSON::Any

value[0]              # => 1
typeof(value[0])      # => JSON::Any
value[0].as_i         # => 1
typeof(value[0].as_i) # => Int32

# value[0] + 1       # Error, because value[0] is JSON::Any
value[0].as_i + 10 # => 11

# json.cr:32 (002.cr)
# pending by 'file:pendings/json/002.cr'
# require "json"
# 
# json = File.open("path/to/file.json") do |file|
#   JSON.parse(file)
# end

# json.cr:47 (003.cr)
require "json"

string = JSON.build do |json|
  json.object do
    json.field "name", "foo"
    json.field "values" do
      json.array do
        json.number 1
        json.number 2
        json.number 3
      end
    end
  end
end
string # => %<{"name":"foo","values":[1,2,3]}>
