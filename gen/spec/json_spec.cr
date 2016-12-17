require "spec"
require "json"
it "json.cr" do
puts # :nocode:

puts "# json.cr:15 (001.cr)" # :nocode: :example:
# require "json"

value = JSON.parse("[1, 2, 3]") # : JSON::Any

( value[0] ).should eq( 1 )
( typeof(value[0]) ).should eq( JSON::Any )
( value[0].as_i ).should eq( 1 )
( typeof(value[0].as_i) ).should eq( Int32 )

# value[0] + 1       # Error, because value[0] is JSON::Any
( value[0].as_i + 10 ).should eq( 11 )

puts "# json.cr:32 (002.cr)" # :nocode: :example:
# pending by 'file:pendings/json/002.cr' # :pending:
# require "json"
# 
# json = File.open("path/to/file.json") do |file|
#   JSON.parse(file)
# end

puts "# json.cr:47 (003.cr)" # :nocode: :example:
# require "json"

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
( string ).should eq( %<{"name":"foo","values":[1,2,3]}> )


end
