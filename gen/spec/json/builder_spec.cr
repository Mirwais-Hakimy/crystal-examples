require "spec"
require "json"
it "json/builder.cr" do
puts # :nocode:

puts "# json/builder.cr:372 (001.cr)" # :nocode: :example:
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
